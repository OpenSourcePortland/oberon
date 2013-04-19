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

ActiveRecord::Schema.define(:version => 20130419192950) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "species"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "location_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "location_type"
    t.integer  "location_size"
    t.integer  "spaceport_size"
    t.integer  "coordinates"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "technical_level",     :default => 0
    t.integer  "pilot_level",         :default => 0
    t.integer  "logistics_level",     :default => 0
    t.integer  "tactical_level",      :default => 0
    t.integer  "interpersonal_level", :default => 0
    t.integer  "wit_level",           :default => 0
    t.integer  "reflex_level",        :default => 0
    t.integer  "endurance_level",     :default => 0
    t.integer  "perception_level",    :default => 0
    t.integer  "leadership_level",    :default => 0
    t.integer  "honesty_level",       :default => 0
    t.integer  "compassion_level",    :default => 0
    t.integer  "courage_level",       :default => 0
    t.integer  "honor_level",         :default => 0
    t.integer  "dependability_level", :default => 0
    t.integer  "character_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
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
    t.string   "ship_type"
    t.integer  "price"
    t.integer  "ship_size"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
