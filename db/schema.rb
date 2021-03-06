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

ActiveRecord::Schema.define(version: 20150108004817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.boolean  "completed"
    t.integer  "repetitions", default: 1
    t.integer  "habit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habits", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "notifications"
    t.datetime "start_date"
    t.datetime "notification_time"
    t.boolean  "github_repo",       default: false
  end

  add_index "habits", ["user_id"], name: "index_habits_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "image"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "email_address"
    t.string   "github_name"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "time_zone",       default: "UTC"
  end

end
