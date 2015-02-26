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

ActiveRecord::Schema.define(version: 20150226164439) do

  create_table "admins", force: :cascade do |t|
    t.string   "account",         limit: 255
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "admin_type",      limit: 255
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name",               limit: 255,             null: false
    t.string   "operating_license",  limit: 255,             null: false
    t.string   "legal_person_name",  limit: 255,             null: false
    t.string   "legal_person_photo", limit: 255,             null: false
    t.integer  "business_status",    limit: 4,   default: 0
    t.integer  "sys_admin_id",       limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "scenic_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "scenics", force: :cascade do |t|
    t.string   "name",           limit: 255, null: false
    t.string   "picture",        limit: 255, null: false
    t.string   "manager_name",   limit: 255, null: false
    t.string   "manager_number", limit: 255, null: false
    t.integer  "sys_admin_id",   limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "name",         limit: 255,               null: false
    t.float    "price",        limit: 24,                null: false
    t.integer  "scenic_id",    limit: 4,                 null: false
    t.string   "picture",      limit: 255
    t.text     "description",  limit: 65535
    t.integer  "ticket_type",  limit: 4,                 null: false
    t.integer  "status",       limit: 4,     default: 0
    t.integer  "sys_admin_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "tickets_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "discount",   limit: 24
  end

  create_table "users", force: :cascade do |t|
    t.string   "account",         limit: 255,             null: false
    t.string   "name",            limit: 255,             null: false
    t.string   "password_digest", limit: 255,             null: false
    t.string   "phone",           limit: 255,             null: false
    t.integer  "user_identity",   limit: 4,   default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
