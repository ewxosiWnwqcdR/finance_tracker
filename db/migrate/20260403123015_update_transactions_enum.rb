class UpdateTransactionsEnum < ActiveRecord::Migration[8.1]
  def up
    create_enum :transaction_type, [ "manual", "imported", "api" ]
  end

  def down
     drop_enum :transaction_type
  end
end
