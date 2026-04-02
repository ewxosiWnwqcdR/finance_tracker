class AddTransactionrefUniqueIndex < ActiveRecord::Migration[8.1]
  def change
    add_index :transactions, [ :account_id, :transaction_ref ], unique: true
  end
end
