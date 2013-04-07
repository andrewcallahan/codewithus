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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130407020456) do

  create_table "hackathons", :force => true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.string   "location"
    t.text     "description"
    t.integer  "capacity"
    t.integer  "price"
    t.string   "image"
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "identities", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "asecret"
    t.string   "atoken"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "oauth_expires_at"
  end

  create_table "participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hackathon_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "role"
  end

  create_table "skillcategories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "skillcategory_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "user_skillcategories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "skillcategory_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "level"
  end

  create_table "user_skills", :force => true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "level"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.string   "cell"
    t.string   "image"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
