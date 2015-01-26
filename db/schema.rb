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

ActiveRecord::Schema.define(version: 20150122082219) do

  create_table "comedies", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movies", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "musics", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newest_fashions", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newest_videos", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newests", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "popular_videos", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "populars", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talent_videos", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talents", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trend_fashions", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trend_videos", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trends", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videonewests", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videopopulars", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videotalents", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videotrends", force: true do |t|
    t.string   "url"
    t.string   "mdata"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "webseries", force: true do |t|
    t.string   "url"
    t.string   "metadata"
    t.string   "thumbimg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
