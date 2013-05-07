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

ActiveRecord::Schema.define(:version => 20130507180455) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "species"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "location_id"
    t.integer  "turns_spent", :default => 0
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "technical",     :default => 0
    t.integer  "pilot",         :default => 0
    t.integer  "logistics",     :default => 0
    t.integer  "tactical",      :default => 0
    t.integer  "charisma",      :default => 0
    t.integer  "wit",           :default => 0
    t.integer  "quickness",     :default => 0
    t.integer  "endurance",     :default => 0
    t.integer  "perception",    :default => 0
    t.integer  "leadership",    :default => 0
    t.integer  "honesty",       :default => 0
    t.integer  "compassion",    :default => 0
    t.integer  "courage",       :default => 0
    t.integer  "honor",         :default => 0
    t.integer  "dependability", :default => 0
    t.integer  "character_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "properties", :force => true do |t|
    t.string   "name"
    t.string   "property_type"
    t.integer  "resource_count"
    t.integer  "output_rate"
    t.boolean  "renewable"
    t.integer  "location_id"
    t.integer  "character_id"
    t.integer  "price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "ships", :force => true do |t|
    t.integer  "character_id"
    t.string   "name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "fuel",         :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
