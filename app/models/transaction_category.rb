class TransactionCategory < ApplicationRecord
  self.table_name = "transaction_categories"

  belongs_to :transaction, class_name: "Transaction"
  belongs_to :category, class_name: "Category"
end
