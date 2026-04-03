class Transaction < ApplicationRecord
  self.table_name = "transactions"

  belongs_to :user, class_name: "User"
  belongs_to :account, class_name: "Account"

  has_many :transaction_categories, class_name: "TransactionCategory", foreign_key: :transaction_id, dependent: :destroy
  has_many :categories, through: :transaction_categories

  enum :entry_type, {
    income: "income",
    expense: "expense",
    transfer: "transfer"
  }

  enum :transaction_type, {
    manual: "manual",
    imported: "imported",
    api: "api"
  }

  validates :amount, presence: true, numericality: { other_than: 0 }
  validates :counterparty, presence: true, length: { minimum: 2, maximum: 50 }

  before_validation :assign_manual_description, if: :manual?
  before_validation :assign_entry_type
  before_create :assign_manual_transaction_ref, if: :manual?

  private

  def assign_manual_description
    if self.description.blank?
      self.description = "manuelle Buchung von " + user.first_name + " " + user.last_name
    end
  end

  def assign_entry_type
    if self.amount != nil
      if self.amount > 0
        self.entry_type = "income"
      elsif self.amount < 0
        self.entry_type = "expense"
      end
    end
  end

  def assign_manual_transaction_ref
    local_transaction = Transaction.manual.where(account_id: self.account_id).last

    if local_transaction == nil
      local_transaction_ref = "mt1"
    elsif local_transaction.transaction_ref.blank?
      local_transaction_ref = "mt1"
    else
        local_transaction_ref = local_transaction.transaction_ref
        local_transaction_ref = "mt" + (local_transaction_ref.delete_prefix("mt").to_i + 1).to_s
    end

    self.transaction_ref = local_transaction_ref
  end
end
