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
end
