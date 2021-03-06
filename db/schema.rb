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

ActiveRecord::Schema.define(:version => 20130805200754) do

  create_table "items", :force => true do |t|
    t.string   "name",       :null => false
    t.float    "price",      :null => false
    t.integer  "user_id",    :null => false
    t.integer  "order_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["order_id", "user_id"], :name => "index_items_on_order_id_and_user_id", :unique => true
  add_index "items", ["order_id"], :name => "index_items_on_order_id"
  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "orders", :force => true do |t|
    t.string   "desc",                          :null => false
    t.integer  "owner_id"
    t.integer  "caller_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "closed",     :default => false
    t.string   "slug"
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "quant",      :null => false
  end

  add_index "payments", ["order_id", "user_id"], :name => "index_payments_on_order_id_and_user_id", :unique => true
  add_index "payments", ["order_id"], :name => "index_payments_on_order_id"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
