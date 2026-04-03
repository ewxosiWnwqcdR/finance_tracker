class AddColumnTransacitonsEnum < ActiveRecord::Migration[8.1]
  def change
    add_column :transactions, :transaction_type, :enum, enum_type: "transaction_type"
  end
end
