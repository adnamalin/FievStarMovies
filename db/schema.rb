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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160713190601) do
=======
ActiveRecord::Schema.define(version: 20160713201542) do
>>>>>>> 92f6e3db8371c1f3fa70799ecc1f7817dab8f086

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "review_id"
    t.string   "commenter_id"
=======
  create_table "movies", force: :cascade do |t|
    t.string   "title",        null: false
    t.string   "description",  null: false
    t.string   "director",     null: false
    t.date     "release_date"
>>>>>>> 92f6e3db8371c1f3fa70799ecc1f7817dab8f086
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

<<<<<<< HEAD
  create_table "movies", force: :cascade do |t|
    t.string "title"
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
=======
  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.integer "movie_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
>>>>>>> 92f6e3db8371c1f3fa70799ecc1f7817dab8f086
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
<<<<<<< HEAD
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=======
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
>>>>>>> 92f6e3db8371c1f3fa70799ecc1f7817dab8f086
  end

end
