class TransactionsController < ApplicationController
  def show
  end

  def new
    @transaction = Transaction.new(posting_date: Date.current)
  end

  def create
    @transaction = Transaction.new(transaction_params.merge(
      account_id: find_account.id,
      user_id: find_user.id,
      description: build_mamual_description,
      entry_type: determine_manual_entry_type,
      transaction_ref: generate_manual_transaction_ref
    ))

    p @transaction
    @transaction.save
  end

  private

  def find_user
    User.find(1)
  end

  def find_account
        Account.find(1)
  end

  def build_mamual_description
    "manuel desc"
  end

  def determine_manual_entry_type
    :income
  end

  def generate_manual_transaction_ref
    "testref"
  end

  def transaction_params
        params.require(:transaction).permit(:payment_reference, :amount, :currency, :counterparty, :posting_date)
  end
end



=begin
  description - bei manuellen Buchungen standarttext - manuelle Buchung von [Firstname + Secondname]
  entry_type - wird abhängig gesetzt, ob die Buchung positiv oder negativ ist.
  transaction_ref - wir suchen die letzte ref der buchungen mit description > manuelle Buchung und addieren zum Stringwert 1 dazu
  Beispiel: ref=mt1 > mt2. mt steht für manual transaction
=end
