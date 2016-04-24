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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160424121829) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "notifications"
    t.float    "critic_value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_on_accounts", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "category_id"
    t.float    "value"
    t.string   "reason"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "transaction_on_accounts", ["account_id"], name: "index_transaction_on_accounts_on_account_id"
  add_index "transaction_on_accounts", ["category_id"], name: "index_transaction_on_accounts_on_category_id"

  create_table "user_logins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "user_agent"
    t.datetime "signed_in_at"
    t.datetime "last_seen_at"
    t.datetime "signed_out_at"
  end

  add_index "user_logins", ["user_id"], name: "index_user_logins_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "role"
    t.string   "unique_session_id",      limit: 20
    t.string   "name"
    t.string   "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
