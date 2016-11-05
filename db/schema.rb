# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161105140135) do

  create_table "authors", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_authors_on_book_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "bookgenres", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_bookgenres_on_book_id"
    t.index ["genre_id"], name: "index_bookgenres_on_genre_id"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price"
    t.integer  "words"
    t.date     "published"
    t.text     "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookseries", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "series_id"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_bookseries_on_book_id"
    t.index ["series_id"], name: "index_bookseries_on_series_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_purchases_on_book_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.string   "title"
    t.text     "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seriesfranchises", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "franchise_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["franchise_id"], name: "index_seriesfranchises_on_franchise_id"
    t.index ["series_id"], name: "index_seriesfranchises_on_series_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "penName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
