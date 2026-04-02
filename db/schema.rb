# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_01_120000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "entry_type", ["income", "expense"]

  create_table "benutzer", force: :cascade do |t|
    t.string "benutzername"
    t.string "name"
    t.string "vorname"
  end

  create_table "buchung_kategorien", force: :cascade do |t|
    t.bigint "buchung_id", null: false
    t.bigint "kategorie_id", null: false
    t.index ["buchung_id"], name: "index_buchung_kategorien_on_buchung_id"
    t.index ["kategorie_id"], name: "index_buchung_kategorien_on_kategorie_id"
  end

  create_table "buchungen", force: :cascade do |t|
    t.text "bemerkung"
    t.bigint "benutzer_id", null: false
    t.string "beschreibung"
    t.decimal "betrag", precision: 12, scale: 2
    t.date "buchungsdatum", null: false
    t.enum "entry_type", null: false, enum_type: "entry_type"
    t.bigint "konto_id", null: false
    t.index ["benutzer_id"], name: "index_buchungen_on_benutzer_id"
    t.index ["konto_id"], name: "index_buchungen_on_konto_id"
  end

  create_table "kategorien", force: :cascade do |t|
    t.string "beschreibung"
    t.string "farbe"
    t.string "titel"
  end

  create_table "konten", force: :cascade do |t|
    t.string "anzeigename"
    t.bigint "benutzer_id", null: false
    t.string "bic"
    t.string "iban"
    t.decimal "startsaldo", precision: 12, scale: 2
    t.index ["benutzer_id"], name: "index_konten_on_benutzer_id"
  end

  add_foreign_key "buchung_kategorien", "buchungen", column: "buchung_id"
  add_foreign_key "buchung_kategorien", "kategorien", column: "kategorie_id"
  add_foreign_key "buchungen", "benutzer"
  add_foreign_key "buchungen", "konten", column: "konto_id"
  add_foreign_key "konten", "benutzer"
end
