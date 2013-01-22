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

ActiveRecord::Schema.define(:version => 20130122104313) do

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "country_translations", :force => true do |t|
    t.integer  "country_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "country_translations", ["country_id"], :name => "index_country_translations_on_country_id"
  add_index "country_translations", ["locale"], :name => "index_country_translations_on_locale"

  create_table "kind_translations", :force => true do |t|
    t.integer  "kind_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "kind_translations", ["kind_id"], :name => "index_kind_translations_on_kind_id"
  add_index "kind_translations", ["locale"], :name => "index_kind_translations_on_locale"

  create_table "kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "machine_translations", :force => true do |t|
    t.integer  "machine_id"
    t.string   "locale"
    t.string   "id_number"
    t.string   "stock_number"
    t.string   "name"
    t.string   "initial_id"
    t.string   "make"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "machine_translations", ["locale"], :name => "index_machine_translations_on_locale"
  add_index "machine_translations", ["machine_id"], :name => "index_machine_translations_on_machine_id"

  create_table "machines", :force => true do |t|
    t.string   "id_number"
    t.string   "stock_number"
    t.integer  "workshop_id"
    t.integer  "kind_id"
    t.string   "name"
    t.string   "initial_id"
    t.string   "make"
    t.integer  "country_id"
    t.integer  "year_of_production"
    t.float    "price"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "family"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "admin",              :default => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "machine_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

end
