class SetColumnTransacitonsEnumNonNull < ActiveRecord::Migration[8.1]
  def change
    change_column_null :transactions, :transaction_type, false
  end
end
