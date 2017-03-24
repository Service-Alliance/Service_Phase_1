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

ActiveRecord::Schema.define(version: 20170323214214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "job_id"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.integer  "insurance_company_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "affected_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.integer  "insurance_company_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "articles", force: :cascade do |t|
    t.text     "content"
    t.string   "title"
    t.integer  "author_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "assignment_types", force: :cascade do |t|
    t.text     "name"
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
    t.integer  "franchise_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "transcription"
    t.integer  "vendor_id"
  end

  create_table "contact_assignments", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "job_id"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "company"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "owner_id"
    t.integer  "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corporate_referral_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "departments", force: :cascade do |t|
    t.string   "name"
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

  create_table "forms", force: :cascade do |t|
    t.string   "name"
    t.string   "package_id"
    t.string   "transaction_id"
    t.string   "signer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "franchise_zipcodes", force: :cascade do |t|
    t.integer  "franchise_id"
    t.integer  "zip_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "franchises", force: :cascade do |t|
    t.string   "name"
    t.integer  "franchise_number"
    t.string   "legal_name"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.integer  "address_id"
    t.string   "general_license"
    t.string   "residential_license"
    t.string   "commercial_license"
    t.string   "mold_remediation_license"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "insurance_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "bulletin_number"
    t.date     "effective_date"
    t.text     "states_involved"
    t.string   "property_type"
    t.text     "collect_deductible"
    t.integer  "esl"
    t.text     "estimating_software"
    t.text     "pricing"
    t.text     "customer_service_contacts"
    t.text     "special_conditions"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "billing_address_first_name"
    t.string   "billing_address_last_name"
    t.integer  "billing_address_id"
    t.integer  "billing_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "job_forms", force: :cascade do |t|
    t.string   "document_id"
    t.boolean  "signed"
    t.string   "name"
    t.string   "link"
    t.integer  "form_id"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_managers", force: :cascade do |t|
    t.integer  "job_manager_id"
    t.date     "schedule_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "job_id"
    t.boolean  "manager_confirmation", default: false
    t.text     "note"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
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
    t.string   "name"
    t.integer  "type_id"
    t.integer  "status_id"
    t.integer  "entered_by_id"
    t.integer  "franchise_id"
    t.text     "details"
    t.text     "job_note"
    t.integer  "customer_id"
    t.integer  "referral_type_id"
    t.boolean  "emergency"
    t.integer  "referral_employee_id"
    t.integer  "corporate_referral_type_id"
    t.integer  "agent_id"
    t.integer  "adjuster_id"
    t.date     "recieved"
    t.date     "last_action"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.text     "referral_note"
    t.integer  "referral_vendor_id"
    t.boolean  "estimate_created",           default: false
    t.date     "estimate_created_date"
    t.boolean  "estimate_sent",              default: false
    t.date     "estimate_sent_date"
    t.boolean  "contract_created",           default: false
    t.date     "contract_created_date"
    t.boolean  "contract_sent",              default: false
    t.date     "contract_sent_date"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text     "tooltip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "losses", force: :cascade do |t|
    t.string   "recieved_by"
    t.datetime "loss_occurred"
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

  create_table "notes", force: :cascade do |t|
    t.text     "note"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "notes", ["noteable_type", "noteable_id"], name: "index_notes_on_noteable_type_and_noteable_id", using: :btree

  create_table "occupants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "address_id"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oncalls", force: :cascade do |t|
    t.date     "scheduled_on"
    t.integer  "user_id"
    t.integer  "priority"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "phone_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "type_id"
    t.string   "extension"
    t.integer  "phoneable_id"
    t.string   "phoneable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "phones", ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "property_type_id"
    t.integer  "structure_type_id"
    t.integer  "year_built"
    t.integer  "floors_affected"
    t.integer  "rooms_affected"
    t.string   "occurred_level"
    t.boolean  "multi_unit"
    t.integer  "ceiling_affected_id"
    t.integer  "walls_affected_id"
    t.integer  "attic_affected_id"
    t.integer  "contents_affected_id"
    t.boolean  "basement_finished"
    t.boolean  "ownership"
    t.boolean  "condo"
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
    t.integer  "structure_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "referral_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
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

  create_table "ticsheets", force: :cascade do |t|
    t.integer  "key_code"
    t.string   "description"
    t.string   "uom"
    t.integer  "percentage"
    t.integer  "quantity"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tracker_tasks", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "tracker_task_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "child_id"
  end

  add_index "trackers", ["trackable_type", "trackable_id"], name: "index_trackers_on_trackable_type_and_trackable_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "upload"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
  end

  add_index "uploads", ["uploadable_type", "uploadable_id"], name: "index_uploads_on_uploadable_type_and_uploadable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id",                default: 0
    t.string   "notes"
    t.integer  "department_id"
    t.string   "title"
    t.string   "additional_title"
    t.integer  "location_id"
    t.date     "background_check"
    t.date     "online_physical"
    t.date     "fitness_test"
    t.string   "hep_b"
    t.boolean  "lead"
    t.date     "lead_expiration"
    t.string   "nys_mold"
    t.date     "nys_mold_expiration"
    t.string   "nys_mold_license"
    t.string   "bio_rec_bbp"
    t.date     "hartford"
    t.date     "pet_water"
    t.date     "pet_fire"
    t.string   "osha"
    t.string   "iicrc_reg"
    t.date     "iicrc_expiration"
    t.date     "cec_due"
    t.integer  "number_cec_due"
    t.string   "iicrc_wrt"
    t.string   "iicrc_amrt"
    t.string   "iicrc_asd"
    t.string   "iicrc_srt"
    t.string   "iicrc_hst"
    t.string   "iicrc_uft"
    t.string   "iicrc_odor"
    t.string   "iicrc_cds"
    t.date     "sub_1"
    t.date     "sub_2"
    t.string   "dry_book"
    t.integer  "login_count"
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

  create_table "vendor_assignments", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "job_id"
    t.text     "note"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "assignment_type_id"
  end

  create_table "vendor_upload_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendor_uploads", force: :cascade do |t|
    t.integer  "vendor_id"
    t.string   "upload"
    t.integer  "vendor_upload_type_id"
    t.date     "expiration_date"
    t.text     "name"
    t.text     "notes"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "category_type"
    t.string   "name"
    t.string   "contact"
    t.string   "phone"
    t.string   "cellphone"
    t.string   "fax"
    t.string   "address"
    t.date     "wc"
    t.date     "liability"
    t.date     "pollution"
    t.date     "auto"
    t.string   "w9"
    t.string   "independent_contractor_agreement"
    t.string   "email"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "work_orders", force: :cascade do |t|
    t.integer  "job_id"
    t.text     "to"
    t.text     "name"
    t.date     "date"
    t.text     "typed_by"
    t.datetime "job_start"
    t.text     "job_name"
    t.text     "job_location"
    t.text     "telephone"
    t.text     "contact"
    t.text     "insurance"
    t.text     "claim_number"
    t.text     "crew"
    t.time     "approx_time_on_loss"
    t.text     "required"
    t.text     "referral"
    t.text     "franchise_location"
    t.text     "scope_of_work"
    t.text     "job_manager_contact_info"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
