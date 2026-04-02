class Account < ApplicationRecord
  self.table_name = "accounts"

  belongs_to :user, class_name: "User"
  has_many :transactions, class_name: "Transaction", foreign_key: :account_id, dependent: :restrict_with_error
end
