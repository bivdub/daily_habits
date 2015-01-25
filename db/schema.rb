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

ActiveRecord::Schema.define(version: 20150125000501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "awards", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "image_url"
    t.integer  "total_completions"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "awards_users", force: :cascade do |t|
    t.integer  "award_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "awards_users", ["award_id"], name: "index_awards_users_on_award_id", using: :btree
  add_index "awards_users", ["user_id"], name: "index_awards_users_on_user_id", using: :btree

  create_table "goal_users", force: :cascade do |t|
    t.integer  "goal_id"
    t.integer  "user_id"
    t.integer  "streak_completed"
    t.integer  "streak_failed"
    t.boolean  "completed_today"
    t.integer  "max_streak"
    t.integer  "max_failed"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "goal_users", ["goal_id"], name: "index_goal_users_on_goal_id", using: :btree
  add_index "goal_users", ["user_id"], name: "index_goal_users_on_user_id", using: :btree

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "users_currently"
    t.integer  "users_ever"
    t.integer  "total_completions"
    t.string   "average_streak_currently"
    t.string   "average_before_breaking"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "goals_users", force: :cascade do |t|
    t.integer  "goal_id"
    t.integer  "user_id"
    t.integer  "streak_completed"
    t.integer  "streak_failed"
    t.boolean  "completed_today"
    t.integer  "max_streak"
    t.integer  "max_failed"
    t.boolean  "active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "goals_users", ["goal_id"], name: "index_goals_users_on_goal_id", using: :btree
  add_index "goals_users", ["user_id"], name: "index_goals_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "provider"
    t.string   "auth_hash"
    t.string   "oauth_token"
    t.datetime "oath_expires_at"
    t.string   "phone"
    t.boolean  "text_alert"
    t.boolean  "email_alert"
    t.boolean  "negative"
    t.boolean  "positive"
    t.string   "zipcode"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "awards_users", "awards"
  add_foreign_key "awards_users", "users"
  add_foreign_key "goal_users", "goals"
  add_foreign_key "goal_users", "users"
  add_foreign_key "goals_users", "goals"
  add_foreign_key "goals_users", "users"
end
