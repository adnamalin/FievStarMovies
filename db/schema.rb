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

ActiveRecord::Schema.define(version: 20160715125342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "movie_id"
  end

  add_index "assignments", ["genre_id"], name: "index_assignments_on_genre_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "review_id"
    t.string   "commenter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title",        null: false
    t.string   "description",  null: false
    t.string   "director"
    t.string   "poster"
    t.date     "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "ratings", ["rateable_type", "rateable_id"], name: "index_ratings_on_rateable_type_and_rateable_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "movie_id"
    t.integer  "reviewer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
