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

ActiveRecord::Schema[7.0].define(version: 2022_07_01_090617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_loans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.date "due_date", null: false
    t.date "loan_date", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_loans_on_book_id"
    t.index ["user_id"], name: "index_book_loans_on_user_id"
  end

  create_table "book_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.string "author", null: false
    t.string "publisher", null: false
    t.date "published_date"
    t.string "category"
    t.string "isbn"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_book_requests_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "category", null: false
    t.string "book_code", null: false
    t.string "title", null: false
    t.string "author", null: false
    t.string "publisher", null: false
    t.date "published_date", null: false
    t.text "description"
    t.integer "copy", null: false
    t.string "isbn", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "course", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "year", null: false
    t.integer "semester", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_loans", "books"
  add_foreign_key "book_loans", "users"
  add_foreign_key "book_requests", "users"
  add_foreign_key "instructors", "users"
  add_foreign_key "students", "users"
end
