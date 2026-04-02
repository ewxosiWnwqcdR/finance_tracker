class CreateFinanceTrackerCoreTables < ActiveRecord::Migration[8.1]
  def up
    create_enum :entry_type, ["income", "expense"]

    create_table :benutzer do |t|
      t.string :benutzername
      t.string :name
      t.string :vorname
    end

    create_table :kategorien do |t|
      t.string :titel
      t.string :beschreibung
      t.string :farbe
    end

    create_table :konten do |t|
      t.string :iban
      t.string :bic
      t.string :anzeigename
      t.decimal :startsaldo, precision: 12, scale: 2
      t.references :benutzer, null: false, foreign_key: { to_table: :benutzer }
    end

    create_table :buchungen do |t|
      t.references :benutzer, null: false, foreign_key: { to_table: :benutzer }
      t.references :konto, null: false, foreign_key: { to_table: :konten }
      t.decimal :betrag, precision: 12, scale: 2
      t.enum :entry_type, enum_type: "entry_type", null: false
      t.string :beschreibung
      t.text :bemerkung
      t.date :buchungsdatum, null: false
    end

    create_table :buchung_kategorien do |t|
      t.references :buchung, null: false, foreign_key: { to_table: :buchungen }
      t.references :kategorie, null: false, foreign_key: { to_table: :kategorien }
    end
  end

  def down
    drop_table :buchung_kategorien
    drop_table :buchungen
    drop_table :konten
    drop_table :kategorien
    drop_table :benutzer

    drop_enum :entry_type
  end
end
