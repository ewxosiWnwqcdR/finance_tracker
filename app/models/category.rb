class Category < ApplicationRecord
  self.table_name = "categories"

  has_many :transaction_categories, class_name: "TransactionCategory", foreign_key: :category_id, dependent: :restrict_with_error
  has_many :transactions, through: :transaction_categories
end
