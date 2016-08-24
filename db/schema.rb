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

ActiveRecord::Schema.define(version: 20160824060123) do

  create_table "blog_comments", force: :cascade do |t|
    t.integer  "commenter_id"
    t.text     "body"
    t.integer  "blog_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["blog_id"], name: "index_blog_comments_on_blog_id"
    t.index ["commenter_id"], name: "index_blog_comments_on_commenter_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "extended_html_content"
    t.integer  "author_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "photo_url"
    t.integer  "view_count",            default: 0
  end

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "blog_id"
    t.integer  "commenter_id"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["blog_id"], name: "index_comments_on_blog_id"
    t.index ["commenter_id", "blog_id"], name: "index_comments_on_commenter_id_and_blog_id", unique: true
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
  end

  create_table "creditratings", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "ratee_id"
    t.integer  "leadership"
    t.integer  "teamwork"
    t.integer  "blogger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratee_id"], name: "index_creditratings_on_ratee_id"
    t.index ["rater_id", "ratee_id"], name: "index_creditratings_on_rater_id_and_ratee_id", unique: true
    t.index ["rater_id"], name: "index_creditratings_on_rater_id"
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followee_id"], name: "index_followings_on_followee_id"
    t.index ["follower_id", "followee_id"], name: "index_followings_on_follower_id_and_followee_id", unique: true
    t.index ["follower_id"], name: "index_followings_on_follower_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "report_users", force: :cascade do |t|
    t.integer  "reporter_id"
    t.integer  "reportee_id"
    t.text     "reason"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["reportee_id"], name: "index_report_users_on_reportee_id"
    t.index ["reporter_id", "reportee_id"], name: "index_report_users_on_reporter_id_and_reportee_id", unique: true
    t.index ["reporter_id"], name: "index_report_users_on_reporter_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tourcomments", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "commenter_id"
    t.text     "content"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["commenter_id"], name: "index_tourcomments_on_commenter_id"
    t.index ["tour_id"], name: "index_tourcomments_on_tour_id"
  end

  create_table "tourimages", force: :cascade do |t|
    t.integer  "tour_id"
    t.string   "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_tourimages_on_tour_id"
  end

  create_table "tourmembers", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "member_id"
    t.string   "role"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id", "tour_id"], name: "index_tourmembers_on_member_id_and_tour_id", unique: true
    t.index ["member_id"], name: "index_tourmembers_on_member_id"
    t.index ["tour_id"], name: "index_tourmembers_on_tour_id"
  end

  create_table "tourratings", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "user_id"
    t.integer  "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_id"], name: "index_tourratings_on_tour_id"
    t.index ["user_id"], name: "index_tourratings_on_user_id"
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
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "avatar_url"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "avatar"
    t.string   "about"
    t.string   "job"
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

end
