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

ActiveRecord::Schema.define(version: 20170104165927) do

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

  create_table "adjusters", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affected_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
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
    t.string   "callsource"
    t.date     "datetime"
    t.string   "trackingnum"
    t.string   "customer_phone_number"
    t.string   "destinationnum"
    t.string   "customer_name"
    t.string   "customer_city"
    t.string   "customer_state"
    t.string   "customer_zip"
    t.string   "customer_country"
    t.string   "keywords"
    t.string   "referrer"
    t.string   "referrermedium"
    t.string   "landingpage"
    t.string   "last_requested_url"
    t.string   "gclid"
    t.string   "ip"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.string   "utma"
    t.string   "utmb"
    t.string   "utmv"
    t.string   "utmz"
    t.string   "utmx"
    t.string   "ga"
    t.string   "first_call"
    t.string   "recording"
    t.integer  "duration"
    t.boolean  "answered"
    t.integer  "user_id"
    t.integer  "job_id"
    t.boolean  "inprogress"
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

  create_table "emergency_contacts", force: :cascade do |t|
    t.integer  "job_id"
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

  create_table "images", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurance_companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_details", force: :cascade do |t|
    t.integer  "insurance_company_id"
    t.string   "claim_number"
    t.string   "policy_number"
    t.integer  "coverage_type_id"
    t.integer  "deductible_amount"
    t.integer  "self_pay_id"
    t.integer  "deductible_id"
    t.integer  "esl_nst_amount_id"
    t.integer  "emergency_service_amount"
    t.integer  "job_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
    t.integer  "billing_address_id"
    t.integer  "billing_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.text     "source_cause"
    t.integer  "previous_water_damage_id"
    t.text     "cleaning_type"
    t.string   "affected_square_footage"
    t.text     "notes"
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

  create_table "phone_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "type_id"
    t.integer  "occupant_id"
    t.integer  "caller_id"
    t.integer  "customer_id"
    t.integer  "agent_id"
    t.integer  "adjuster_id"
    t.integer  "emergency_contact_id"
    t.string   "extension"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
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
    t.boolean  "basement_finished"
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
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "call_rep",               default: false, null: false
    t.boolean  "job_coordinator",        default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
