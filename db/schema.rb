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

ActiveRecord::Schema.define(version: 20150728021129) do

  create_table "album_photos", force: :cascade do |t|
    t.integer  "album_id",   limit: 4
    t.integer  "photo_id",   limit: 4
    t.boolean  "hidden",               default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "album_photos", ["album_id", "photo_id"], name: "index_album_photos_on_album_id_and_photo_id", using: :btree

  create_table "album_users", force: :cascade do |t|
    t.integer  "album_id",    limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "access_type", limit: 4, default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "album_users", ["album_id", "user_id"], name: "index_album_users_on_album_id_and_user_id", using: :btree

  create_table "albums", force: :cascade do |t|
    t.string   "title",          limit: 255,                null: false
    t.integer  "cover",          limit: 4,   default: 0,    null: false
    t.integer  "visibility",     limit: 4,   default: 0
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "is_pie_album",               default: true
    t.string   "subject_first",  limit: 255
    t.string   "subject_middle", limit: 255
    t.string   "subject_last",   limit: 255
    t.date     "subject_dob"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "filepath",       limit: 255,                     null: false
    t.string   "filetype",       limit: 255,   default: "image"
    t.integer  "user_id",        limit: 4,                       null: false
    t.date     "meta_timestamp"
    t.date     "user_timestamp"
    t.integer  "width",          limit: 4
    t.integer  "height",         limit: 4
    t.text     "caption",        limit: 65535
    t.text     "tags",           limit: 65535
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 20,  null: false
    t.string   "email",           limit: 40,  null: false
    t.string   "firstname",       limit: 20
    t.string   "lastname",        limit: 40
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.boolean  "is_admin"
  end

end
