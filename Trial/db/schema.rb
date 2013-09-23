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

ActiveRecord::Schema.define(:version => 20130923011109) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.date     "created_at",  :null => false
    t.boolean  "maintenance"
    t.datetime "updated_at",  :null => false
  end

  create_table "fights", :force => true do |t|
    t.integer  "petown_id"
    t.integer  "monster_id"
    t.integer  "round"
    t.integer  "damage"
    t.boolean  "miss"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.binary   "image"
    t.text     "description"
    t.integer  "hp"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "spd"
    t.integer  "cost"
    t.boolean  "equip_flag"
    t.string   "type"
    t.date     "created_at",  :null => false
    t.boolean  "maintenance"
    t.datetime "updated_at",  :null => false
  end

  create_table "maintopics", :force => true do |t|
    t.integer  "user_id"
    t.string   "topicname"
    t.date     "created_on"
    t.boolean  "maintenance"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "narratives", :force => true do |t|
    t.integer  "sub_id"
    t.integer  "user_id"
    t.text     "story"
    t.date     "created_on"
    t.boolean  "maintenance"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pet_items", :force => true do |t|
    t.integer  "petown_id"
    t.integer  "item_id"
    t.boolean  "reusable"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pet_owners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pet_id"
    t.string   "name"
    t.integer  "level"
    t.integer  "hp"
    t.integer  "def"
    t.integer  "atk"
    t.integer  "spd"
    t.integer  "hp_max"
    t.integer  "exp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pets", :force => true do |t|
    t.string   "species_name"
    t.text     "description"
    t.datetime "created_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subtopics", :force => true do |t|
    t.integer  "main_id"
    t.integer  "user_id"
    t.string   "topicname"
    t.date     "created_on"
    t.boolean  "maintenance"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "vname"
    t.date     "joined_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

end
