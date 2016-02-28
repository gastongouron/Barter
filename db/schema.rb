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

ActiveRecord::Schema.define(version: 20160226123310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "helps", force: :cascade do |t|
    t.string   "name"
    t.integer  "owner"
    t.text     "description"
    t.boolean  "chosen",      default: false
    t.integer  "service_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
  end

  add_index "helps", ["service_id"], name: "index_helps_on_service_id", using: :btree
  add_index "helps", ["user_id"], name: "index_helps_on_user_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.string   "servicer_name"
    t.integer  "servicer_id"
    t.integer  "helper_id"
    t.integer  "help_id"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "credited",      default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "archived",      default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "admin",           default: false
    t.integer  "timecoin",        default: 1
  end

  add_foreign_key "helps", "services"
end
