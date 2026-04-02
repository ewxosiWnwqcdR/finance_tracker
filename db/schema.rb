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

ActiveRecord::Schema[8.1].define(version: 2026_04_02_165628) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "entry_type", ["income", "expense", "transfer"]

  create_table "accounts", force: :cascade do |t|
    t.string "bank_name", null: false
    t.string "bic"
    t.string "display_name"
    t.string "iban"
    t.decimal "opening_balance", precision: 12, scale: 2
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "color"
    t.string "description"
    t.string "title"
  end

  create_table "transaction_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "transaction_id", null: false
    t.index ["category_id"], name: "index_transaction_categories_on_category_id"
    t.index ["transaction_id"], name: "index_transaction_categories_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.decimal "amount", precision: 12, scale: 2
    t.string "counterparty"
    t.string "currency", null: false
    t.string "description"
    t.enum "entry_type", null: false, enum_type: "entry_type"
    t.text "payment_reference"
    t.date "posting_date", null: false
    t.string "transaction_ref", null: false
    t.bigint "user_id", null: false
    t.index ["account_id", "transaction_ref"], name: "index_transactions_on_account_id_and_transaction_ref", unique: true
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "transaction_categories", "categories"
  add_foreign_key "transaction_categories", "transactions"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "users"
end
