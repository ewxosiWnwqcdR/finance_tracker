class UpdateTablesToeng < ActiveRecord::Migration[8.1]
  def change
    rename_column :buchungen, :benutzer_id, :user_id
    rename_column :buchungen, :konto_id, :account_id
    rename_column :buchungen, :betrag, :amount
    rename_column :buchungen, :beschreibung, :description
    rename_column :buchungen, :bemerkung, :payment_reference
    rename_column :buchungen, :buchungsdatum, :posting_date
    rename_column :buchung_kategorien, :buchung_id, :transaction_id
    rename_column :buchung_kategorien, :kategorie_id, :category_id
    rename_column :kategorien, :titel, :title
    rename_column :kategorien, :beschreibung, :description
    rename_column :kategorien, :farbe, :color
    rename_column :benutzer, :benutzername, :username
    rename_column :benutzer, :name, :last_name
    rename_column :benutzer, :vorname, :first_name
    rename_column :konten, :anzeigename, :display_name
    rename_column :konten, :startsaldo, :opening_balance
    rename_column :konten, :benutzer_id, :user_id

    add_column :konten, :bank_name, :string, null: false
    change_table :buchungen do |t|
      t.string :counterparty
      t.string :currency, null: false
      t.string :transaction_ref, null: false
    end

    rename_table :buchung_kategorien, :transaction_categories
    rename_table :kategorien, :categories
    rename_table :buchungen, :transactions
    rename_table :benutzer, :users
    rename_table :konten, :accounts
  end
end
