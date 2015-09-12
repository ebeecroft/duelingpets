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

ActiveRecord::Schema.define(:version => 20150912231832) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.datetime "created_on"
    t.boolean  "maintenance",  :default => false
    t.integer  "from_user_id"
  end

  create_table "equips", :force => true do |t|
    t.integer  "petowner_id"
    t.integer  "inventory_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "fights", :force => true do |t|
    t.integer  "petowner_id"
    t.integer  "pet_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "round",       :default => 1
    t.integer  "pdamage"
    t.integer  "mdamage"
    t.integer  "coins"
    t.integer  "mhp"
    t.boolean  "battle_done", :default => false
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_on"
    t.boolean  "maintenance", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "inventories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "equipped",   :default => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_on"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "hp"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "spd"
    t.integer  "cost"
    t.string   "ipicture"
    t.string   "type"
    t.boolean  "manyuses",    :default => false
    t.boolean  "maintenance", :default => false
  end

  create_table "maintenancemodes", :force => true do |t|
    t.string   "name"
    t.datetime "created_on"
    t.boolean  "maintenance_on", :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "maintopics", :force => true do |t|
    t.integer  "user_id"
    t.string   "topicname"
    t.text     "description"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "created_on"
    t.boolean  "maintenance",   :default => false
    t.integer  "tcontainer_id"
  end

  create_table "narratives", :force => true do |t|
    t.integer  "subtopic_id"
    t.integer  "user_id"
    t.text     "story"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.datetime "created_on"
    t.boolean  "maintenance", :default => false
  end

  create_table "petowners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pet_id"
    t.string   "pet_name"
    t.datetime "adopted_on"
    t.boolean  "maintenance", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "level"
    t.integer  "hp"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "spd"
    t.integer  "exp",         :default => 0
    t.integer  "hp_max"
    t.boolean  "in_battle",   :default => false
  end

  create_table "pets", :force => true do |t|
    t.string   "species_name"
    t.text     "description"
    t.datetime "created_on"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "level"
    t.integer  "hp"
    t.integer  "atk"
    t.integer  "def"
    t.integer  "spd"
    t.integer  "cost"
    t.string   "image"
    t.boolean  "monster",      :default => false
    t.string   "created_by"
    t.boolean  "reviewed",     :default => false
    t.boolean  "starter",      :default => false
    t.boolean  "maintenance",  :default => false
  end

  create_table "pouches", :force => true do |t|
    t.integer  "amount",     :default => 200
    t.integer  "user_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "pouches", ["user_id"], :name => "index_pouches_on_user_id", :unique => true

  create_table "subtopics", :force => true do |t|
    t.integer  "maintopic_id"
    t.integer  "user_id"
    t.string   "topicname"
    t.text     "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.datetime "created_on"
    t.boolean  "maintenance",  :default => false
  end

  create_table "suggestions", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tcontainers", :force => true do |t|
    t.string   "name"
    t.integer  "forum_id"
    t.datetime "created_on"
    t.boolean  "maintenance", :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "vname"
    t.datetime "joined_on"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "maintenance",     :default => false
    t.string   "avatar"
  end

end
