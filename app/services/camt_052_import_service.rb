# app/services/camt052_import_service.rb
require "nokogiri"
require "bigdecimal"

class Camt052ImportService
  CAMT_052_NS = "urn:iso:std:iso:20022:tech:xsd:camt.052.001.08".freeze

  def initialize(xml_content)
    @xml_content = xml_content
  end

  def call
    doc = Nokogiri::XML(@xml_content) { |config| config.strict.noblanks }

    raise ArgumentError, "Ungültiges XML" if doc.errors.any?
    raise ArgumentError, "Datei ist keine CAMT.052.001.08" unless valid_camt_052_document?(doc)

    rows = []

    reports(doc).each do |report|
      account_identifier = account(report)
      running_balance = opening_booked_balance(report)

      entries(report).each do |entry|
        transaction_detail = first_transaction_detail(entry)

        amount_node = entry.at_xpath("./c:Amt", ns)
        next unless amount_node

        entry_type = text_at(entry, "./c:CdtDbtInd")
        amount = signed_amount(amount_node.text, entry_type)
        currency = amount_node["Ccy"]

        row = {
          booking_text: booking_text(entry, transaction_detail),
          amount: amount,
          entry_type: entry_type,
          date: booking_date(entry),
          account: account_identifier,
          counterparty_name: counterparty_name(transaction_detail, entry_type),
          remittance_information: remittance_text(transaction_detail),
          balance_after_booking: nil,
          currency: currency,
          booking_id: booking_id(entry, transaction_detail)
        }

        # Optional berechnet:
        # funktioniert nur sinnvoll, wenn ein Anfangssaldo vorhanden ist
        # und die Reihenfolge der Buchungen in der Datei passt.
        unless running_balance.nil?
          running_balance += amount
          row[:balance_after_booking] = running_balance
        end

        rows << row
      end
    end

    rows
  end

  private

  def ns
    { "c" => CAMT_052_NS }
  end

  def valid_camt_052_document?(doc)
    doc.root&.name == "Document" &&
      doc.root&.namespace&.href == CAMT_052_NS
  end

  def reports(doc)
    doc.xpath("/c:Document/c:BkToCstmrAcctRpt/c:Rpt", ns)
  end

  def entries(report)
    report.xpath("./c:Ntry", ns)
  end

  def first_transaction_detail(entry)
    entry.at_xpath("./c:NtryDtls/c:TxDtls", ns)
  end

  def text_at(node, xpath)
    return nil if node.nil?

    found = node.at_xpath(xpath, ns)
    value = found&.text&.strip
    value.present? ? value : nil
  end

  def account(report)
    text_at(report, "./c:Acct/c:Id/c:IBAN") ||
      text_at(report, "./c:Acct/c:Id/c:Othr/c:Id")
  end

  def booking_date(entry)
    text_at(entry, "./c:BookgDt/c:Dt") ||
      text_at(entry, "./c:BookgDt/c:DtTm") ||
      text_at(entry, "./c:ValDt/c:Dt") ||
      text_at(entry, "./c:ValDt/c:DtTm")
  end

  def booking_text(entry, transaction_detail)
    text_at(entry, "./c:AddtlNtryInf") ||
      text_at(transaction_detail, "./c:AddtlTxInf")
  end

  def counterparty_name(transaction_detail, entry_type)
    return nil if transaction_detail.nil?

    if entry_type == "DBIT"
      text_at(transaction_detail, "./c:RltdPties/c:Cdtr/c:Nm") ||
        text_at(transaction_detail, "./c:RltdPties/c:Dbtr/c:Nm")
    else
      text_at(transaction_detail, "./c:RltdPties/c:Dbtr/c:Nm") ||
        text_at(transaction_detail, "./c:RltdPties/c:Cdtr/c:Nm")
    end
  end

  def remittance_text(transaction_detail)
    return nil if transaction_detail.nil?

    parts = transaction_detail.xpath("./c:RmtInf/c:Ustrd", ns).map { |node| node.text.strip }.reject(&:empty?)
    return parts.join(" ") if parts.any?

    text_at(transaction_detail, "./c:RmtInf/c:Strd/c:AddtlRmtInf")
  end

  def booking_id(entry, transaction_detail)
    text_at(transaction_detail, "./c:Refs/c:AcctSvcrRef") ||
      text_at(entry, "./c:AcctSvcrRef") ||
      text_at(transaction_detail, "./c:Refs/c:EndToEndId") ||
      text_at(transaction_detail, "./c:Refs/c:TxId")
  end

  def opening_booked_balance(report)
    balance_node = report.xpath("./c:Bal", ns).find do |bal|
      text_at(bal, "./c:Tp/c:CdOrPrtry/c:Cd") == "OPBD"
    end

    amount = text_at(balance_node, "./c:Amt")
    return nil if amount.nil?

    BigDecimal(amount)
  end

  def signed_amount(raw_amount, entry_type)
    amount = BigDecimal(raw_amount.to_s)
    entry_type == "DBIT" ? -amount : amount
  end
end
