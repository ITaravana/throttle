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

ActiveRecord::Schema.define(version: 20160526025140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "user_id"
    t.date     "check_in_date"
    t.date     "check_out_date"
    t.integer  "total_price"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "pay_check",      default: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["vehicle_id"], name: "index_taggings_on_vehicle_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.string   "pic"
    t.string   "first_name"
    t.date     "birthday"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "on_hire"
    t.string   "description"
    t.string   "ext_desc"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.integer  "price_per_day"
    t.string   "brand"
    t.string   "model"
    t.string   "image"
    t.string   "type_vehicle"
    t.string   "model_year"
    t.string   "accessories"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "cc"
    t.string   "min_day_rent"
    t.string   "max_day_rent"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "vehicles"
end
