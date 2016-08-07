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

ActiveRecord::Schema.define(version: 20160807071006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "blog_id"
    t.integer  "commenter_id"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id", using: :btree
    t.index ["commenter_id", "blog_id"], name: "index_comments_on_commenter_id_and_blog_id", unique: true, using: :btree
    t.index ["commenter_id"], name: "index_comments_on_commenter_id", using: :btree
  end

  create_table "creditratings", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "ratee_id"
    t.integer  "leadership"
    t.integer  "teamwork"
    t.integer  "blogger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratee_id"], name: "index_creditratings_on_ratee_id", using: :btree
    t.index ["rater_id", "ratee_id"], name: "index_creditratings_on_rater_id_and_ratee_id", unique: true, using: :btree
    t.index ["rater_id"], name: "index_creditratings_on_rater_id", using: :btree
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followee_id"], name: "index_followings_on_followee_id", using: :btree
    t.index ["follower_id", "followee_id"], name: "index_followings_on_follower_id_and_followee_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_followings_on_follower_id", using: :btree
  end

  create_table "report_users", force: :cascade do |t|
    t.integer  "reporter_id"
    t.integer  "reportee_id"
    t.text     "reason"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["reportee_id"], name: "index_report_users_on_reportee_id", using: :btree
    t.index ["reporter_id", "reportee_id"], name: "index_report_users_on_reporter_id_and_reportee_id", unique: true, using: :btree
    t.index ["reporter_id"], name: "index_report_users_on_reporter_id", using: :btree
  end

  create_table "tourcomments", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "commenter_id"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["commenter_id"], name: "index_tourcomments_on_commenter_id", using: :btree
    t.index ["tour_id"], name: "index_tourcomments_on_tour_id", using: :btree
  end

  create_table "tourmembers", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "member_id"
    t.string   "role"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id", "tour_id"], name: "index_tourmembers_on_member_id_and_tour_id", unique: true, using: :btree
    t.index ["member_id"], name: "index_tourmembers_on_member_id", using: :btree
    t.index ["tour_id"], name: "index_tourmembers_on_tour_id", using: :btree
  end

  create_table "tours", force: :cascade do |t|
    t.string   "title"
    t.string   "fromplace"
    t.string   "toplace"
    t.datetime "fromtime"
    t.datetime "totime"
    t.integer  "maxmember"
    t.integer  "creator_id"
    t.decimal  "estimatebudget"
    t.decimal  "deposit"
    t.string   "transport"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.date     "dob"
    t.boolean  "gender"
    t.string   "avatar_url"
    t.string   "address"
    t.boolean  "is_active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
