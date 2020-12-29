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

ActiveRecord::Schema.define(version: 2020_12_25_223004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "relateds", id: :serial, force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.datetime "date"
    t.string "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trendings", id: :serial, force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.datetime "date"
    t.string "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_irl", default: false
    t.boolean "is_youtube", default: false
    t.string "vimeo_video_id"
    t.string "thumb_nail"
    t.boolean "accepted"
    t.string "views"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "super_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "video_views", force: :cascade do |t|
    t.string "youtube_url"
    t.string "video_url"
    t.string "views"
    t.integer "video_id"
  end

  create_table "videos", id: :serial, force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.datetime "date"
    t.string "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "description"
    t.string "author"
    t.boolean "deleted", default: false
    t.boolean "processed", default: false
    t.boolean "accepted", default: false
    t.string "author_email"
    t.string "vimeo_video_id"
    t.string "thumb_nail"
    t.string "frame"
    t.boolean "agreed_to_vid_sub_policy", default: false
    t.boolean "is_youtube", default: false
    t.boolean "is_irl", default: false
    t.string "views"
    t.boolean "is_twitter", default: false
    t.index ["url"], name: "index_videos_on_url", unique: true
    t.index ["vimeo_video_id"], name: "index_videos_on_vimeo_video_id", unique: true
  end

  create_table "youtubes", id: :serial, force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.datetime "date"
    t.string "meta_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "views"
    t.index ["url"], name: "index_youtubes_on_url", unique: true
  end

  add_foreign_key "video_views", "videos", column: "video_url", primary_key: "url", on_delete: :cascade
  add_foreign_key "video_views", "videos", on_delete: :cascade
  add_foreign_key "video_views", "youtubes", column: "youtube_url", primary_key: "url", on_delete: :cascade
end
