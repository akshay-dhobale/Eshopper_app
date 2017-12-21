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

ActiveRecord::Schema.define(version: 20171220100634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "brandcategories", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_brandcategories_on_brand_id"
    t.index ["category_id"], name: "index_brandcategories_on_category_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.bigint "user_id"
    t.index ["product_id"], name: "index_carts_on_product_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "cms", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "meta_title"
    t.text "meta_description"
    t.text "meta_keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "configurations", force: :cascade do |t|
    t.string "conf_key"
    t.string "conf_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_us", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "contact_no"
    t.text "message"
    t.text "note_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.float "percent_off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons_useds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "quantity"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.bigint "product_id"
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "address_id"
    t.bigint "coupon_id"
    t.bigint "payment_gateway_id"
    t.float "grand_total"
    t.float "shipping_charges"
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id"
    t.index ["payment_gateway_id"], name: "index_orders_on_payment_gateway_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_gateways", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_attribute_assocs", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "product_attribute_id"
    t.bigint "product_attribute_value_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_attribute_id"], name: "index_product_attribute_assocs_on_product_attribute_id"
    t.index ["product_attribute_value_id"], name: "index_product_attribute_assocs_on_product_attribute_value_id"
    t.index ["product_id"], name: "index_product_attribute_assocs_on_product_id"
  end

  create_table "product_attribute_values", force: :cascade do |t|
    t.string "attr_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_attributes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "product_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.string "image_name"
    t.boolean "status"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prod_img_file_name"
    t.string "prod_img_content_type"
    t.integer "prod_img_file_size"
    t.datetime "prod_img_updated_at"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.string "short_description"
    t.text "long_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.boolean "status"
    t.decimal "price", precision: 14, scale: 2
    t.decimal "special_price", precision: 14, scale: 2
    t.date "special_price_from"
    t.date "special_price_to"
    t.string "meta_title"
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "productsubcategories", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_productsubcategories_on_product_id"
    t.index ["subcategory_id"], name: "index_productsubcategories_on_subcategory_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "permission"
    t.string "twitter_token"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wishlists_on_product_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "brandcategories", "brands"
  add_foreign_key "brandcategories", "categories"
  add_foreign_key "carts", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "coupons"
  add_foreign_key "orders", "payment_gateways"
  add_foreign_key "orders", "users"
  add_foreign_key "product_attribute_assocs", "product_attribute_values"
  add_foreign_key "product_attribute_assocs", "product_attributes"
  add_foreign_key "product_attribute_assocs", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "productsubcategories", "products"
  add_foreign_key "productsubcategories", "subcategories"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "wishlists", "products"
  add_foreign_key "wishlists", "users"
end
