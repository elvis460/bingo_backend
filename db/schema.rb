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

ActiveRecord::Schema.define(version: 20160403031636) do

  create_table "admins", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "account",         limit: 255
    t.boolean  "del_mark",                    default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "password_digest", limit: 255
  end

  create_table "exams", force: :cascade do |t|
    t.string   "question",   limit: 255
    t.string   "answer",     limit: 255
    t.string   "tips",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "level",      limit: 4
  end

  create_table "systems", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "keyword",     limit: 255
    t.string   "email",       limit: 255
    t.string   "phone",       limit: 255
    t.string   "fax",         limit: 255
    t.string   "address",     limit: 255
    t.string   "facebook",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "account",         limit: 255
    t.string   "password",        limit: 255
    t.string   "birthday",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.integer  "identity",        limit: 4
    t.integer  "record",          limit: 4
  end

end
