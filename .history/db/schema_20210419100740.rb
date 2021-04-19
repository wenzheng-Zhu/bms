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

ActiveRecord::Schema.define(version: 2021_04_19_020358) do

  create_table "accounts", force: :cascade do |t|
    t.decimal "balance", precision: 8, scale: 2
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id", "user_id"], name: "index_accounts_on_book_id_and_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "sn"
    t.string "state", 
    t.integer "loan_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loan_id", "title", "sn"], name: "index_books_on_loan_id_and_title_and_sn"
  end

  create_table "loans", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_loans_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "gender"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.index ["name", "phone", "email"], name: "index_users_on_name_and_phone_and_email"
  end

end
