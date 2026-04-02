class User < ApplicationRecord
  self.table_name = "users"

  has_many :accounts, class_name: "Account", foreign_key: :user_id, dependent: :restrict_with_error
  has_many :transactions, class_name: "Transaction", foreign_key: :user_id, dependent: :restrict_with_error
end
