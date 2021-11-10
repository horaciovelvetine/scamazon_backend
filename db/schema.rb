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

ActiveRecord::Schema.define(version: 2021_11_06_173846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "issued_by"
    t.string "number"
    t.string "expires", null: false
    t.string "name_on", null: false
    t.integer "ccv", null: false
    t.bigint "wallet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_accounts_on_number", unique: true
    t.index ["wallet_id"], name: "index_accounts_on_wallet_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "unit"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.boolean "def_address", default: false
    t.bigint "user_id"
    t.bigint "store_id"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_addresses_on_account_id"
    t.index ["store_id"], name: "index_addresses_on_store_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.integer "helpful", default: 0
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "gift_cards", force: :cascade do |t|
    t.string "redeem_code"
    t.string "notes", default: ""
    t.decimal "amount", precision: 7, scale: 2
    t.bigint "wallet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["redeem_code"], name: "index_gift_cards_on_redeem_code"
    t.index ["wallet_id"], name: "index_gift_cards_on_wallet_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "store_id"
    t.index ["store_id"], name: "index_inventories_on_store_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "rating", precision: 3, scale: 2, default: "0.0"
    t.bigint "category_id", null: false
    t.bigint "order_id"
    t.bigint "shopping_cart_id"
    t.bigint "inventory_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["shopping_cart_id"], name: "index_items_on_shopping_cart_id"
  end

  create_table "items_lists", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "list_id", null: false
    t.index ["item_id", "list_id"], name: "index_items_lists_on_item_id_and_list_id"
    t.index ["list_id", "item_id"], name: "index_items_lists_on_list_id_and_item_id"
  end

  create_table "items_searches", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "search_id", null: false
    t.index ["item_id", "search_id"], name: "index_items_searches_on_item_id_and_search_id"
    t.index ["search_id", "item_id"], name: "index_items_searches_on_search_id_and_item_id"
  end

  create_table "items_tags", id: false, force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "tag_id", null: false
    t.index ["item_id", "tag_id"], name: "index_items_tags_on_item_id_and_tag_id"
    t.index ["tag_id", "item_id"], name: "index_items_tags_on_tag_id_and_item_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "private", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "lists_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "list_id", null: false
    t.index ["list_id", "tag_id"], name: "index_lists_tags_on_list_id_and_tag_id"
    t.index ["tag_id", "list_id"], name: "index_lists_tags_on_tag_id_and_list_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "sub_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "grand_total", precision: 10, scale: 2, default: "0.0"
    t.decimal "shipping_cost", precision: 6, scale: 2, default: "0.0"
    t.datetime "shipped_on"
    t.string "shipping_info"
    t.string "tracking_info"
    t.boolean "slime", default: false, null: false
    t.bigint "user_id", null: false
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status_id"], name: "index_orders_on_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.string "body", null: false
    t.integer "helpful", default: 0
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_questions_on_item_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", null: false
    t.string "body", null: false
    t.decimal "rating", precision: 3, scale: 2
    t.integer "helpful", default: 0
    t.boolean "verified_pur", default: false
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
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_searches_on_category_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.decimal "sub_total", precision: 10, scale: 2, default: "0.0"
    t.integer "num_items", default: 0
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_statuses_on_name"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "description"
    t.string "logo"
    t.string "industry"
    t.string "mission_statement"
    t.string "ein"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_stores_on_name"
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "styles", force: :cascade do |t|
    t.string "name", null: false
    t.string "model"
    t.bigint "sku"
    t.decimal "price", precision: 10, scale: 2
    t.string "color"
    t.string "material"
    t.integer "quantity", null: false
    t.string "weight"
    t.string "dimensions"
    t.string "manufacturer"
    t.string "country_origin"
    t.bigint "item_id", null: false
    t.bigint "order_id"
    t.bigint "shopping_cart_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_styles_on_item_id"
    t.index ["model"], name: "index_styles_on_model"
    t.index ["order_id"], name: "index_styles_on_order_id"
    t.index ["shopping_cart_id"], name: "index_styles_on_shopping_cart_id"
    t.index ["sku"], name: "index_styles_on_sku"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.boolean "slime", default: false
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "viewed_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.boolean "saved_for_later"
    t.index ["item_id"], name: "index_viewed_items_on_item_id"
    t.index ["user_id"], name: "index_viewed_items_on_user_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.decimal "balance", precision: 10, scale: 2, default: "0.0"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "accounts", "wallets"
  add_foreign_key "addresses", "accounts"
  add_foreign_key "addresses", "stores"
  add_foreign_key "addresses", "users"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "gift_cards", "wallets"
  add_foreign_key "inventories", "stores"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "inventories"
  add_foreign_key "items", "orders"
  add_foreign_key "items", "shopping_carts"
  add_foreign_key "items_lists", "items"
  add_foreign_key "items_lists", "lists"
  add_foreign_key "items_searches", "items"
  add_foreign_key "items_searches", "searches"
  add_foreign_key "items_tags", "items"
  add_foreign_key "items_tags", "tags"
  add_foreign_key "lists", "users"
  add_foreign_key "lists_tags", "lists"
  add_foreign_key "lists_tags", "tags"
  add_foreign_key "orders", "statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "questions", "items"
  add_foreign_key "questions", "users"
  add_foreign_key "reviews", "items"
  add_foreign_key "reviews", "users"
  add_foreign_key "searches", "categories"
  add_foreign_key "searches", "users"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "stores", "users"
  add_foreign_key "styles", "items"
  add_foreign_key "styles", "orders"
  add_foreign_key "styles", "shopping_carts"
  add_foreign_key "wallets", "users"
end
