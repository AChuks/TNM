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

ActiveRecord::Schema.define(version: 20190926163142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "relateds", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "date"
    t.string   "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trendings", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "date"
    t.string   "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "super_admin",     default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "date"
    t.string   "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "author"
    t.boolean  "deleted",        default: false
    t.boolean  "processed",      default: false
    t.boolean  "accepted",       default: false
    t.string   "author_email"
    t.string   "vimeo_video_id"
    t.string   "thumb_nail"
    t.string   "frame"
  end

  create_table "youtubes", force: :cascade do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "date"
    t.string   "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
