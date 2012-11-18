# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121111032111) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_notes", :force => true do |t|
    t.string   "resource_id",     :null => false
    t.string   "resource_type",   :null => false
    t.integer  "admin_user_id"
    t.string   "admin_user_type"
    t.text     "body"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "admin_notes", ["admin_user_type", "admin_user_id"], :name => "index_admin_notes_on_admin_user_type_and_admin_user_id"
  add_index "admin_notes", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.integer  "credit_card_number"
    t.integer  "exp_month"
    t.integer  "exp_year"
    t.integer  "cvc"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "credit_cards", ["address_id"], :name => "index_credit_cards_on_address_id"
  add_index "credit_cards", ["user_id"], :name => "index_credit_cards_on_user_id"

  create_table "orders", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "price"
    t.integer  "quantity"
    t.date     "date_of_purchase"
    t.string   "order_status"
    t.integer  "tracking_number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "product_name"
    t.text     "description"
    t.string   "brand"
    t.string   "digital_link"
    t.integer  "popularity index"
    t.float    "price"
    t.integer  "quantity"
    t.integer  "quantity_sold"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "user_reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "reviewer_id"
    t.text     "review"
    t.integer  "rating"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_reviews", ["reviewer_id"], :name => "index_user_reviews_on_reviewer_id"
  add_index "user_reviews", ["user_id"], :name => "index_user_reviews_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number"
    t.integer  "total_rating"
    t.integer  "number_of_ratings"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "wishlists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
