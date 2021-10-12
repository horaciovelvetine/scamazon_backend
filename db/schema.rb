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

ActiveRecord::Schema.define(version: 2021_10_12_193112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_items", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "item_id", null: false
    t.index ["category_id"], name: "index_categories_items_on_category_id"
    t.index ["item_id"], name: "index_categories_items_on_item_id"
  end

  create_table "categories_searches", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "search_id", null: false
    t.index ["category_id"], name: "index_categories_searches_on_category_id"
    t.index ["search_id"], name: "index_categories_searches_on_search_id"
  end

  create_table "gift_cards", force: :cascade do |t|
    t.bigint "code"
    t.money "balance", scale: 2
    t.string "notes"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gift_cards_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "notes"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_inventories_on_store_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "model"
    t.string "manufacturer", null: false
    t.string "country_of_origin", null: false
    t.string "picture"
    t.string "material"
    t.money "price", scale: 2, null: false
    t.bigint "sku"
    t.decimal "rating", default: "0.0"
    t.integer "weight"
    t.bigint "inventory_id", null: false
    t.bigint "order_id_id"
    t.bigint "shopping_cart_id_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
    t.index ["order_id_id"], name: "index_items_on_order_id_id"
    t.index ["shopping_cart_id_id"], name: "index_items_on_shopping_cart_id_id"
  end

  create_table "items_lists", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "list_id", null: false
    t.index ["item_id"], name: "index_items_lists_on_item_id"
    t.index ["list_id"], name: "index_items_lists_on_list_id"
  end

  create_table "items_searches", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "search_id", null: false
    t.index ["item_id"], name: "index_items_searches_on_item_id"
    t.index ["search_id"], name: "index_items_searches_on_search_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.money "total", scale: 2, null: false
    t.string "ship_to_address", null: false
    t.string "status", null: false
    t.date "order_placed"
    t.date "delivered_on"
    t.boolean "slime"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "rating", null: false
    t.boolean "verified_purchaser"
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_reviews_on_item_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "query", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "item_count", default: 0
    t.money "total", scale: 2, null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "description"
    t.string "logo"
    t.string "industry"
    t.string "mission_statement"
    t.bigint "ein"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.boolean "slime", default: false
    t.string "address", null: false
    t.money "balance", scale: 2, default: "0.0"
    t.string "phone", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
