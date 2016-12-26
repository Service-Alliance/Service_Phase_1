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

ActiveRecord::Schema.define(version: 20161223192054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.integer  "zip_code"
    t.string   "city"
    t.string   "county"
    t.integer  "state_id"
    t.integer  "address_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "affected_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "callers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calls", force: :cascade do |t|
    t.string   "callrail_id"
    t.string   "recording"
    t.string   "callrail_user"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "start_time"
    t.string   "customer_phone_number"
    t.integer  "duration"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "customer_addresses", force: :cascade do |t|
    t.integer  "address_id"
    t.integer  "customer_id"
    t.integer  "address_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flooring_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer  "type_id"
    t.integer  "status_id"
    t.integer  "entered_by_id"
    t.integer  "franchise_id"
    t.text     "details"
    t.text     "notes"
    t.integer  "customer_id"
    t.integer  "referral_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "loss_cause_types", force: :cascade do |t|
    t.integer  "loss_type_id"
    t.integer  "loss_cause_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "loss_causes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loss_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "losses", force: :cascade do |t|
    t.string   "recieved_by"
    t.datetime "loss_occured"
    t.datetime "fnol_recieved"
    t.date     "customer_called"
    t.integer  "job_id"
    t.integer  "loss_type_id"
    t.integer  "loss_cause_id"
    t.integer  "standing_water_id"
    t.integer  "water_available_id"
    t.integer  "electricity_available_id"
    t.integer  "source_off_id"
    t.integer  "visible_mold_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "occupants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "type_id"
    t.integer  "occupant_id"
    t.integer  "caller_id"
    t.integer  "customer_id"
    t.string   "extension"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "property_type_id"
    t.integer  "structure_type_id"
    t.integer  "year_built"
    t.integer  "floors_affected"
    t.integer  "rooms_affected"
    t.integer  "occured_level"
    t.boolean  "multi_unit"
    t.integer  "ceiling_affected_id"
    t.integer  "walls_affected_id"
    t.integer  "attic_affected_id"
    t.integer  "contents_affected_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "property_flooring_types", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "flooring_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "property_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "structure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "referral_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structure_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "access_level"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
