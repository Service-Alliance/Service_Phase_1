# encoding: UTF-8
# This file is auto-generated from the current content of the database. Instead
# of editing this file, please use the migrations feature of Seed Migration to
# incrementally modify your database, and then regenerate this seed file.
#
# If you need to create the database on another system, you should be using
# db:seed, not running all the migrations from scratch. The latter is a flawed
# and unsustainable approach (the more migrations you'll amass, the slower
# it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Base.transaction do
  User.create(email: 'callrep@test.com', password: 'password', password_confirmation: 'password', role_id: 3, first_name: 'Call', last_name: 'Rep', department_id: 1)
  User.create(email: 'jobcoordinator@test.com', first_name: 'User', last_name: 'Two', password: 'password', password_confirmation: 'password', role_id: 2)
  User.create(email: 'admin@test.com', first_name: 'User', last_name: 'Three', password: 'password', password_confirmation: 'password', role_id: 1)
  User.create(email: 'creaumond@gmail.com', password: 'password', password_confirmation: 'password', role_id: 1, first_name: 'Connor', last_name: 'Reaumond', department_id: 1)


  ActiveRecord::Base.connection.reset_pk_sequence!('users')

  Role.create({"id"=>1, "name"=>"Admin"})

  Role.create({"id"=>2, "name"=>"Job Coordinator"})

  Role.create({"id"=>3, "name"=>"Call Rep"})

  Role.create({"id"=>4, "name"=>"Project Manager"})

  Role.create({"id"=>5, "name"=>"Crew Chief"})

  Role.create({"id"=>6, "name"=>"Technician"})

  Role.create({"id"=>7, "name"=>"Owner"})

  Role.create({"id"=>8, "name"=>"Collections Department"})
  ActiveRecord::Base.connection.reset_pk_sequence!('roles')

  Address.create({"address_1"=>"Address 1", "address_2"=>"Address 2", "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>1, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>"123 Anywhere Ln", "address_2"=>"Suite 2017", "address_type_id"=>nil, "city"=>"Chicago", "county"=>"Cook County", "id"=>2, "state_id"=>36, "zip_code"=>"60622"})

  Address.create({"address_1"=>"3090 Route 112", "address_2"=>nil, "address_type_id"=>nil, "city"=>"Medford", "county"=>nil, "id"=>3, "state_id"=>32, "zip_code"=>"11763"})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>4, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>"", "address_2"=>"", "address_type_id"=>nil, "city"=>"", "county"=>"", "id"=>5, "state_id"=>nil, "zip_code"=>""})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>6, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>7, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>8, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>"", "address_2"=>"", "address_type_id"=>nil, "city"=>"", "county"=>"", "id"=>9, "state_id"=>nil, "zip_code"=>""})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>10, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>11, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>12, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>"", "address_2"=>"", "address_type_id"=>nil, "city"=>"", "county"=>"", "id"=>13, "state_id"=>nil, "zip_code"=>""})

  Address.create({"address_1"=>nil, "address_2"=>nil, "address_type_id"=>nil, "city"=>nil, "county"=>nil, "id"=>14, "state_id"=>nil, "zip_code"=>nil})

  Address.create({"address_1"=>"", "address_2"=>"", "address_type_id"=>nil, "city"=>"", "county"=>"", "id"=>15, "state_id"=>nil, "zip_code"=>""})
  ActiveRecord::Base.connection.reset_pk_sequence!('addresses')

  Agent.create({"address_id"=>1, "email"=>"jcinninger@gmail.com", "first_name"=>"Jake", "id"=>1, "insurance_company_id"=>1, "last_name"=>"Cinninger"})
  ActiveRecord::Base.connection.reset_pk_sequence!('agents')

  Adjuster.create({"address_id"=>1, "email"=>"jcinninger@gmail.com", "first_name"=>"Brendan", "id"=>1, "insurance_company_id"=>1, "last_name"=>"Bayliss"})
  ActiveRecord::Base.connection.reset_pk_sequence!('adjusters')

  Department.create({"id"=>1, "name"=>"Administrative"})

  Department.create({"id"=>2, "name"=>"Accounting"})

  Department.create({"id"=>3, "name"=>"Consultant"})

  Department.create({"id"=>4, "name"=>"Collections"})

  Department.create({"id"=>5, "name"=>"Construction"})

  Department.create({"id"=>6, "name"=>"Operations"})

  Department.create({"id"=>7, "name"=>"Marketing"})

  Department.create({"id"=>8, "name"=>"Marketing & Operations"})
  ActiveRecord::Base.connection.reset_pk_sequence!('departments')

  Location.create({"id"=>1, "name"=>"Medford Office"})

  Location.create({"id"=>2, "name"=>"Field New York"})

  Location.create({"id"=>3, "name"=>"Field Queens"})

  Location.create({"id"=>4, "name"=>"Field New Jersey"})

  Location.create({"id"=>5, "name"=>"Field Medford"})

  Location.create({"id"=>6, "name"=>"Medford WH"})

  Location.create({"id"=>7, "name"=>"Queens WH"})

  Location.create({"id"=>8, "name"=>"Long Island WH"})

  Location.create({"id"=>9, "name"=>"New Jersey Office"})

  Location.create({"id"=>10, "name"=>"New Jersey"})
  ActiveRecord::Base.connection.reset_pk_sequence!('locations')

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>nil, "details"=>"This is a really good detail", "emergency"=>nil, "entered_by_id"=>1, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>1, "id"=>1, "job_note"=>"This is an even better note.", "name"=>nil, "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>nil, "referral_type_id"=>1, "referral_vendor_id"=>nil, "status_id"=>1, "type_id"=>1, "work_center_link"=>nil, "xact_link"=>nil})

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>1, "details"=>"", "emergency"=>false, "entered_by_id"=>3, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>nil, "id"=>2, "job_note"=>"", "name"=>"", "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>"", "referral_type_id"=>nil, "referral_vendor_id"=>nil, "status_id"=>1, "type_id"=>nil, "work_center_link"=>nil, "xact_link"=>nil})

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>2, "details"=>nil, "emergency"=>nil, "entered_by_id"=>3, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>nil, "id"=>3, "job_note"=>nil,  "name"=>nil, "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>nil, "referral_type_id"=>nil, "referral_vendor_id"=>nil, "status_id"=>nil, "type_id"=>nil, "work_center_link"=>nil, "xact_link"=>nil})

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>3, "details"=>"", "emergency"=>false, "entered_by_id"=>3, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>nil, "id"=>4, "job_note"=>"",  "name"=>"", "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>"", "referral_type_id"=>nil, "referral_vendor_id"=>nil, "status_id"=>1, "type_id"=>nil, "work_center_link"=>nil, "xact_link"=>nil})

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>4, "details"=>nil, "emergency"=>nil, "entered_by_id"=>3, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>nil, "id"=>5, "job_note"=>nil,  "name"=>nil, "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>nil, "referral_type_id"=>nil, "referral_vendor_id"=>nil, "status_id"=>nil, "type_id"=>nil, "work_center_link"=>nil, "xact_link"=>nil})

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>5, "details"=>"", "emergency"=>false, "entered_by_id"=>3, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>nil, "id"=>6, "job_note"=>"",  "name"=>"", "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>"", "referral_type_id"=>nil, "referral_vendor_id"=>nil, "status_id"=>1, "type_id"=>nil, "work_center_link"=>nil, "xact_link"=>nil})

  Job.create({"adjuster_id"=>nil, "agent_id"=>nil, "contract_created"=>false, "contract_created_date"=>nil, "contract_sent"=>false, "contract_sent_date"=>nil, "coordinator_id"=>nil, "corporate_referral_type_id"=>nil, "customer_id"=>6, "details"=>"", "emergency"=>false, "entered_by_id"=>3, "estimate_created"=>false, "estimate_created_date"=>nil, "estimate_sent"=>false, "estimate_sent_date"=>nil, "fnol_received"=>nil, "franchise_id"=>nil, "id"=>7, "job_note"=>"",  "name"=>"", "pipeline_status_id"=>nil, "recieved"=>nil, "referral_employee_id"=>nil, "referral_note"=>"", "referral_type_id"=>nil, "referral_vendor_id"=>nil, "status_id"=>1, "type_id"=>nil, "work_center_link"=>nil, "xact_link"=>nil})
  ActiveRecord::Base.connection.reset_pk_sequence!('jobs')

  Caller.create({"address_id"=>1, "email"=>"dhh@test.com", "first_name"=>"David Heinemeier", "id"=>1, "job_id"=>1, "last_name"=>"Hansson"})

  Caller.create({"address_id"=>5, "email"=>"", "first_name"=>"test", "id"=>2, "job_id"=>2, "last_name"=>""})

  Caller.create({"address_id"=>7, "email"=>nil, "first_name"=>nil, "id"=>3, "job_id"=>3, "last_name"=>nil})

  Caller.create({"address_id"=>9, "email"=>"", "first_name"=>"", "id"=>4, "job_id"=>4, "last_name"=>""})

  Caller.create({"address_id"=>11, "email"=>nil, "first_name"=>nil, "id"=>5, "job_id"=>5, "last_name"=>nil})

  Caller.create({"address_id"=>13, "email"=>"", "first_name"=>"test", "id"=>6, "job_id"=>6, "last_name"=>""})

  Caller.create({"address_id"=>15, "email"=>"", "first_name"=>"test", "id"=>7, "job_id"=>7, "last_name"=>""})
  ActiveRecord::Base.connection.reset_pk_sequence!('callers')

  Phone.create({"extension"=>nil, "id"=>1, "number"=>"911", "phoneable_id"=>nil, "phoneable_type"=>nil, "type_id"=>1})
  ActiveRecord::Base.connection.reset_pk_sequence!('phones')

  Call.create({"answered"=>nil, "callrail_id"=>nil, "callsource"=>nil, "customer_city"=>"Chicago", "customer_country"=>"USA", "customer_id"=>nil, "customer_name"=>"Olivia Rodriguez", "customer_phone_number"=>"+17703334444", "customer_state"=>"IL", "customer_zip"=>"60622", "datetime"=>nil, "destinationnum"=>nil, "duration"=>nil, "first_call"=>nil, "franchise_id"=>nil, "ga"=>nil, "gclid"=>nil, "id"=>1, "inprogress"=>true, "ip"=>nil, "job_id"=>nil, "keywords"=>nil, "landingpage"=>nil, "last_requested_url"=>nil, "recording"=>nil, "referrer"=>nil, "referrermedium"=>nil, "trackingnum"=>nil, "transcription"=>nil, "user_id"=>nil, "utm_campaign"=>nil, "utm_content"=>nil, "utm_medium"=>nil, "utm_source"=>nil, "utm_term"=>nil, "utma"=>nil, "utmb"=>nil, "utmv"=>nil, "utmx"=>nil, "utmz"=>nil, "vendor_id"=>nil})

  Call.create({"answered"=>nil, "callrail_id"=>nil, "callsource"=>nil, "customer_city"=>"Lake Forest", "customer_country"=>"USA", "customer_id"=>nil, "customer_name"=>"John Smith", "customer_phone_number"=>"+18473375371", "customer_state"=>"IL", "customer_zip"=>"60045", "datetime"=>nil, "destinationnum"=>nil, "duration"=>nil, "first_call"=>nil, "franchise_id"=>nil, "ga"=>nil, "gclid"=>nil, "id"=>2, "inprogress"=>true, "ip"=>nil, "job_id"=>nil, "keywords"=>nil, "landingpage"=>nil, "last_requested_url"=>nil, "recording"=>nil, "referrer"=>nil, "referrermedium"=>nil, "trackingnum"=>nil, "transcription"=>nil, "user_id"=>nil, "utm_campaign"=>nil, "utm_content"=>nil, "utm_medium"=>nil, "utm_source"=>nil, "utm_term"=>nil, "utma"=>nil, "utmb"=>nil, "utmv"=>nil, "utmx"=>nil, "utmz"=>nil, "vendor_id"=>nil})

  Call.create({"answered"=>nil, "callrail_id"=>nil, "callsource"=>nil, "customer_city"=>"Chicago", "customer_country"=>"USA", "customer_id"=>nil, "customer_name"=>"Olivia Rodriguez", "customer_phone_number"=>"+17703334444", "customer_state"=>"IL", "customer_zip"=>"60622", "datetime"=>nil, "destinationnum"=>nil, "duration"=>nil, "first_call"=>nil, "franchise_id"=>nil, "ga"=>nil, "gclid"=>nil, "id"=>3, "inprogress"=>true, "ip"=>nil, "job_id"=>nil, "keywords"=>nil, "landingpage"=>nil, "last_requested_url"=>nil, "recording"=>nil, "referrer"=>nil, "referrermedium"=>nil, "trackingnum"=>nil, "transcription"=>nil, "user_id"=>nil, "utm_campaign"=>nil, "utm_content"=>nil, "utm_medium"=>nil, "utm_source"=>nil, "utm_term"=>nil, "utma"=>nil, "utmb"=>nil, "utmv"=>nil, "utmx"=>nil, "utmz"=>nil, "vendor_id"=>nil})
  ActiveRecord::Base.connection.reset_pk_sequence!('calls')

  JobStatus.create({"id"=>1, "name"=>"Pending"})

  JobStatus.create({"id"=>2, "name"=>"Active"})

  JobStatus.create({"id"=>3, "name"=>"Invoiced"})

  JobStatus.create({"id"=>4, "name"=>"Dead"})
  ActiveRecord::Base.connection.reset_pk_sequence!('job_statuses')

  JobType.create({"id"=>1, "name"=>"General Cleaning"})
  ActiveRecord::Base.connection.reset_pk_sequence!('job_types')

  CorporateReferralType.create({"id"=>1, "name"=>"Xact Analysis"})

  CorporateReferralType.create({"id"=>2, "name"=>"Nexxus"})

  CorporateReferralType.create({"id"=>3, "name"=>"Contractor Connections"})
  ActiveRecord::Base.connection.reset_pk_sequence!('corporate_referral_types')

  Franchise.create({"address_id"=>nil, "commercial_license"=>nil, "fax"=>nil, "franchise_number"=>nil, "general_license"=>nil, "id"=>1, "legal_name"=>nil, "mold_remediation_license"=>nil, "name"=>"Central Manhattan", "phone"=>nil, "residential_license"=>nil, "website"=>nil})

  Franchise.create({"address_id"=>nil, "commercial_license"=>nil, "fax"=>nil, "franchise_number"=>nil, "general_license"=>nil, "id"=>2, "legal_name"=>nil, "mold_remediation_license"=>nil, "name"=>"East Windsor", "phone"=>nil, "residential_license"=>nil, "website"=>nil})

  Franchise.create({"address_id"=>3, "commercial_license"=>"", "fax"=>nil, "franchise_number"=>9584, "general_license"=>"", "id"=>3, "legal_name"=>"Restoration Services of Medford, LLC", "mold_remediation_license"=>"", "name"=>"Medford", "phone"=>"(631) 732-4931", "residential_license"=>"", "website"=>"http://www.servpromedfordny.com/"})

  Franchise.create({"address_id"=>nil, "commercial_license"=>nil, "fax"=>nil, "franchise_number"=>nil, "general_license"=>nil, "id"=>4, "legal_name"=>nil, "mold_remediation_license"=>nil, "name"=>"Oakdale/North Bay Shore", "phone"=>nil, "residential_license"=>nil, "website"=>nil})

  Franchise.create({"address_id"=>nil, "commercial_license"=>nil, "fax"=>nil, "franchise_number"=>nil, "general_license"=>nil, "id"=>5, "legal_name"=>nil, "mold_remediation_license"=>nil, "name"=>"Old Bridge/Cranbury", "phone"=>nil, "residential_license"=>nil, "website"=>nil})

  Franchise.create({"address_id"=>nil, "commercial_license"=>nil, "fax"=>nil, "franchise_number"=>nil, "general_license"=>nil, "id"=>6, "legal_name"=>nil, "mold_remediation_license"=>nil, "name"=>"Southwest Brooklyn", "phone"=>nil, "residential_license"=>nil, "website"=>nil})
  ActiveRecord::Base.connection.reset_pk_sequence!('franchises')

  ReferralType.create({"id"=>1, "name"=>"Servpro Corporate"})

  ReferralType.create({"id"=>2, "name"=>"Internet"})

  ReferralType.create({"id"=>3, "name"=>"TV"})

  ReferralType.create({"id"=>4, "name"=>"Yellowpages"})

  ReferralType.create({"id"=>5, "name"=>"Other"})

  ReferralType.create({"id"=>6, "name"=>"Refused"})

  ReferralType.create({"id"=>7, "name"=>"IAC Dispatch"})

  ReferralType.create({"id"=>8, "name"=>"Friend"})

  ReferralType.create({"id"=>9, "name"=>"Insurance Adjuster"})

  ReferralType.create({"id"=>10, "name"=>"Insurance Agent"})

  ReferralType.create({"id"=>11, "name"=>"Neighbor"})

  ReferralType.create({"id"=>12, "name"=>"Plumber"})

  ReferralType.create({"id"=>13, "name"=>"Previous Customer"})

  ReferralType.create({"id"=>14, "name"=>"Servpro Franchise"})

  ReferralType.create({"id"=>15, "name"=>"Servpro Employee"})

  ReferralType.create({"id"=>16, "name"=>"Vendor"})

  ReferralType.create({"id"=>17, "name"=>"Property Manager"})

  ReferralType.create({"id"=>18, "name"=>"Realtor"})

  ReferralType.create({"id"=>19, "name"=>"Relative"})
  ActiveRecord::Base.connection.reset_pk_sequence!('referral_types')

  StructureType.create({"id"=>1, "name"=>"Residential"})

  StructureType.create({"id"=>2, "name"=>"Commercial"})

  StructureType.create({"id"=>3, "name"=>"Restaurant"})


  PropertyType.create({"id"=>1, "name"=>"Church", "structure_type_id"=>2})

  PropertyType.create({"id"=>2, "name"=>"Factory", "structure_type_id"=>2})

  PropertyType.create({"id"=>3, "name"=>"Historic", "structure_type_id"=>2})

  PropertyType.create({"id"=>4, "name"=>"Office Building", "structure_type_id"=>2})

  PropertyType.create({"id"=>5, "name"=>"Retail Space", "structure_type_id"=>2})

  PropertyType.create({"id"=>6, "name"=>"School", "structure_type_id"=>2})

  PropertyType.create({"id"=>7, "name"=>"Warehouse", "structure_type_id"=>2})

  PropertyType.create({"id"=>8, "name"=>"Apartment", "structure_type_id"=>1})

  PropertyType.create({"id"=>9, "name"=>"Condo", "structure_type_id"=>1})

  PropertyType.create({"id"=>10, "name"=>"Duplex", "structure_type_id"=>1})

  PropertyType.create({"id"=>11, "name"=>"High Rise", "structure_type_id"=>1})

  PropertyType.create({"id"=>12, "name"=>"House - Single", "structure_type_id"=>1})

  PropertyType.create({"id"=>13, "name"=>"Family", "structure_type_id"=>1})
  ActiveRecord::Base.connection.reset_pk_sequence!('property_types')

  AffectedType.create({"id"=>1, "name"=>"Yes"})

  AffectedType.create({"id"=>2, "name"=>"No"})

  AffectedType.create({"id"=>3, "name"=>"Unkown"})
  ActiveRecord::Base.connection.reset_pk_sequence!('affected_types')

  FlooringType.create({"id"=>1, "name"=>"Carpet"})

  FlooringType.create({"id"=>2, "name"=>"Concrete/Masonry"})

  FlooringType.create({"id"=>3, "name"=>"Hardwood"})

  FlooringType.create({"id"=>4, "name"=>"Other"})

  FlooringType.create({"id"=>5, "name"=>"Tile"})

  FlooringType.create({"id"=>6, "name"=>"Vinyl"})
  ActiveRecord::Base.connection.reset_pk_sequence!('flooring_types')

  LossType.create({"id"=>1, "name"=>"Content Inventory", "tooltip"=>"Tooltip about content inventory"})

  LossType.create({"id"=>2, "name"=>"Fire", "tooltip"=>"Tooltip about fires"})

  LossType.create({"id"=>3, "name"=>"Fire/Water", "tooltip"=>"Tooltip about fire & water"})

  LossType.create({"id"=>4, "name"=>"General Cleaning", "tooltip"=>"Tooltip about general cleaning"})

  LossType.create({"id"=>5, "name"=>"Liability", "tooltip"=>"Tooltip about liability"})

  LossType.create({"id"=>6, "name"=>"Mold", "tooltip"=>"Tooltip about mold"})

  LossType.create({"id"=>7, "name"=>"Odor", "tooltip"=>"Tooltip about odor"})

  LossType.create({"id"=>8, "name"=>"Sewage", "tooltip"=>"Tooltip about sewage"})

  LossType.create({"id"=>9, "name"=>"Smoke", "tooltip"=>"Tooltip about smoke"})

  LossType.create({"id"=>10, "name"=>"Vandalism", "tooltip"=>"Tooltip about vandalism"})

  LossType.create({"id"=>11, "name"=>"Water", "tooltip"=>"Tooltip about water"})

  LossType.create({"id"=>12, "name"=>"Tree Removal", "tooltip"=>"Tooltip about trees"})

  LossType.create({"id"=>13, "name"=>"Equipment Rental", "tooltip"=>"Tooltip about rentals"})

  LossType.create({"id"=>14, "name"=>"Construction", "tooltip"=>"Tooltip about construction"})

  LossType.create({"id"=>16, "name"=>"Board Up", "tooltip"=>nil})
  ActiveRecord::Base.connection.reset_pk_sequence!('loss_types')

  LossCause.create({"id"=>1, "name"=>"Fire"})

  LossCause.create({"id"=>2, "name"=>"Other"})

  LossCause.create({"id"=>3, "name"=>"Sewage"})

  LossCause.create({"id"=>4, "name"=>"Smoke"})

  LossCause.create({"id"=>5, "name"=>"Water"})

  LossCause.create({"id"=>6, "name"=>"Candle"})

  LossCause.create({"id"=>7, "name"=>"Dishwasher"})

  LossCause.create({"id"=>8, "name"=>"Electrical Malfunction"})

  LossCause.create({"id"=>9, "name"=>"Grease"})

  LossCause.create({"id"=>10, "name"=>"Lightning"})

  LossCause.create({"id"=>11, "name"=>"Other Appliance"})

  LossCause.create({"id"=>12, "name"=>"Puffback-Furnace"})

  LossCause.create({"id"=>13, "name"=>"Refrigerator"})

  LossCause.create({"id"=>14, "name"=>"Stove/Oven"})

  LossCause.create({"id"=>15, "name"=>"Unknown"})

  LossCause.create({"id"=>16, "name"=>"Washing Machine"})

  LossCause.create({"id"=>17, "name"=>"AC Leak"})

  LossCause.create({"id"=>18, "name"=>"Hot Water Heater"})

  LossCause.create({"id"=>19, "name"=>"Flood"})

  LossCause.create({"id"=>20, "name"=>"Hurricane"})

  LossCause.create({"id"=>21, "name"=>"Ice Storm"})

  LossCause.create({"id"=>22, "name"=>"Other Weather"})

  LossCause.create({"id"=>23, "name"=>"Pipe"})

  LossCause.create({"id"=>24, "name"=>"Roof Leak"})

  LossCause.create({"id"=>25, "name"=>"Slab Leak"})

  LossCause.create({"id"=>26, "name"=>"Sump Pump Failure"})

  LossCause.create({"id"=>27, "name"=>"Toilet"})

  LossCause.create({"id"=>28, "name"=>"Tornado"})

  LossCause.create({"id"=>29, "name"=>"Wind"})

  LossCause.create({"id"=>30, "name"=>"Animal"})

  LossCause.create({"id"=>31, "name"=>"Mildew"})

  LossCause.create({"id"=>32, "name"=>"Sewage Back-Up"})

  LossCause.create({"id"=>33, "name"=>"Stain on Carpet"})

  LossCause.create({"id"=>36, "name"=>"Rain"})

  LossCause.create({"id"=>37, "name"=>"Post Construction"})
  ActiveRecord::Base.connection.reset_pk_sequence!('loss_causes')

  LossCauseType.create({"id"=>1, "loss_cause_id"=>1, "loss_type_id"=>1})

  LossCauseType.create({"id"=>2, "loss_cause_id"=>2, "loss_type_id"=>1})

  LossCauseType.create({"id"=>3, "loss_cause_id"=>3, "loss_type_id"=>1})

  LossCauseType.create({"id"=>4, "loss_cause_id"=>4, "loss_type_id"=>1})

  LossCauseType.create({"id"=>5, "loss_cause_id"=>5, "loss_type_id"=>1})

  LossCauseType.create({"id"=>6, "loss_cause_id"=>6, "loss_type_id"=>2})

  LossCauseType.create({"id"=>7, "loss_cause_id"=>7, "loss_type_id"=>2})

  LossCauseType.create({"id"=>8, "loss_cause_id"=>8, "loss_type_id"=>2})

  LossCauseType.create({"id"=>9, "loss_cause_id"=>9, "loss_type_id"=>2})

  LossCauseType.create({"id"=>10, "loss_cause_id"=>10, "loss_type_id"=>2})

  LossCauseType.create({"id"=>11, "loss_cause_id"=>2, "loss_type_id"=>2})

  LossCauseType.create({"id"=>12, "loss_cause_id"=>11, "loss_type_id"=>2})

  LossCauseType.create({"id"=>13, "loss_cause_id"=>12, "loss_type_id"=>2})

  LossCauseType.create({"id"=>14, "loss_cause_id"=>13, "loss_type_id"=>2})

  LossCauseType.create({"id"=>15, "loss_cause_id"=>14, "loss_type_id"=>2})

  LossCauseType.create({"id"=>16, "loss_cause_id"=>15, "loss_type_id"=>2})

  LossCauseType.create({"id"=>17, "loss_cause_id"=>16, "loss_type_id"=>2})

  LossCauseType.create({"id"=>18, "loss_cause_id"=>6, "loss_type_id"=>3})

  LossCauseType.create({"id"=>19, "loss_cause_id"=>7, "loss_type_id"=>3})

  LossCauseType.create({"id"=>20, "loss_cause_id"=>8, "loss_type_id"=>3})

  LossCauseType.create({"id"=>21, "loss_cause_id"=>9, "loss_type_id"=>3})

  LossCauseType.create({"id"=>22, "loss_cause_id"=>10, "loss_type_id"=>3})

  LossCauseType.create({"id"=>23, "loss_cause_id"=>2, "loss_type_id"=>3})

  LossCauseType.create({"id"=>24, "loss_cause_id"=>11, "loss_type_id"=>3})

  LossCauseType.create({"id"=>25, "loss_cause_id"=>12, "loss_type_id"=>3})

  LossCauseType.create({"id"=>26, "loss_cause_id"=>13, "loss_type_id"=>3})

  LossCauseType.create({"id"=>27, "loss_cause_id"=>14, "loss_type_id"=>3})

  LossCauseType.create({"id"=>28, "loss_cause_id"=>15, "loss_type_id"=>3})

  LossCauseType.create({"id"=>29, "loss_cause_id"=>16, "loss_type_id"=>3})

  LossCauseType.create({"id"=>30, "loss_cause_id"=>2, "loss_type_id"=>4})

  LossCauseType.create({"id"=>31, "loss_cause_id"=>17, "loss_type_id"=>5})

  LossCauseType.create({"id"=>32, "loss_cause_id"=>18, "loss_type_id"=>5})

  LossCauseType.create({"id"=>33, "loss_cause_id"=>2, "loss_type_id"=>5})

  LossCauseType.create({"id"=>34, "loss_cause_id"=>11, "loss_type_id"=>5})

  LossCauseType.create({"id"=>35, "loss_cause_id"=>13, "loss_type_id"=>5})

  LossCauseType.create({"id"=>36, "loss_cause_id"=>14, "loss_type_id"=>5})

  LossCauseType.create({"id"=>37, "loss_cause_id"=>16, "loss_type_id"=>5})

  LossCauseType.create({"id"=>38, "loss_cause_id"=>17, "loss_type_id"=>6})

  LossCauseType.create({"id"=>39, "loss_cause_id"=>19, "loss_type_id"=>6})

  LossCauseType.create({"id"=>40, "loss_cause_id"=>18, "loss_type_id"=>6})

  LossCauseType.create({"id"=>41, "loss_cause_id"=>20, "loss_type_id"=>6})

  LossCauseType.create({"id"=>42, "loss_cause_id"=>21, "loss_type_id"=>6})

  LossCauseType.create({"id"=>43, "loss_cause_id"=>31, "loss_type_id"=>6})

  LossCauseType.create({"id"=>44, "loss_cause_id"=>2, "loss_type_id"=>6})

  LossCauseType.create({"id"=>45, "loss_cause_id"=>22, "loss_type_id"=>6})

  LossCauseType.create({"id"=>46, "loss_cause_id"=>23, "loss_type_id"=>6})

  LossCauseType.create({"id"=>47, "loss_cause_id"=>24, "loss_type_id"=>6})

  LossCauseType.create({"id"=>48, "loss_cause_id"=>25, "loss_type_id"=>6})

  LossCauseType.create({"id"=>49, "loss_cause_id"=>26, "loss_type_id"=>6})

  LossCauseType.create({"id"=>50, "loss_cause_id"=>27, "loss_type_id"=>6})

  LossCauseType.create({"id"=>51, "loss_cause_id"=>28, "loss_type_id"=>6})

  LossCauseType.create({"id"=>52, "loss_cause_id"=>15, "loss_type_id"=>6})

  LossCauseType.create({"id"=>53, "loss_cause_id"=>29, "loss_type_id"=>6})

  LossCauseType.create({"id"=>54, "loss_cause_id"=>30, "loss_type_id"=>7})

  LossCauseType.create({"id"=>55, "loss_cause_id"=>8, "loss_type_id"=>7})

  LossCauseType.create({"id"=>56, "loss_cause_id"=>9, "loss_type_id"=>7})

  LossCauseType.create({"id"=>57, "loss_cause_id"=>31, "loss_type_id"=>7})

  LossCauseType.create({"id"=>58, "loss_cause_id"=>2, "loss_type_id"=>7})

  LossCauseType.create({"id"=>59, "loss_cause_id"=>32, "loss_type_id"=>7})

  LossCauseType.create({"id"=>60, "loss_cause_id"=>33, "loss_type_id"=>7})

  LossCauseType.create({"id"=>61, "loss_cause_id"=>15, "loss_type_id"=>7})

  LossCauseType.create({"id"=>62, "loss_cause_id"=>17, "loss_type_id"=>8})

  LossCauseType.create({"id"=>63, "loss_cause_id"=>19, "loss_type_id"=>8})

  LossCauseType.create({"id"=>64, "loss_cause_id"=>18, "loss_type_id"=>8})

  LossCauseType.create({"id"=>65, "loss_cause_id"=>20, "loss_type_id"=>8})

  LossCauseType.create({"id"=>66, "loss_cause_id"=>21, "loss_type_id"=>8})

  LossCauseType.create({"id"=>67, "loss_cause_id"=>31, "loss_type_id"=>8})

  LossCauseType.create({"id"=>68, "loss_cause_id"=>25, "loss_type_id"=>8})

  LossCauseType.create({"id"=>69, "loss_cause_id"=>26, "loss_type_id"=>8})

  LossCauseType.create({"id"=>70, "loss_cause_id"=>27, "loss_type_id"=>8})

  LossCauseType.create({"id"=>71, "loss_cause_id"=>28, "loss_type_id"=>8})

  LossCauseType.create({"id"=>72, "loss_cause_id"=>15, "loss_type_id"=>8})

  LossCauseType.create({"id"=>73, "loss_cause_id"=>29, "loss_type_id"=>8})

  LossCauseType.create({"id"=>74, "loss_cause_id"=>6, "loss_type_id"=>9})

  LossCauseType.create({"id"=>75, "loss_cause_id"=>7, "loss_type_id"=>9})

  LossCauseType.create({"id"=>76, "loss_cause_id"=>8, "loss_type_id"=>9})

  LossCauseType.create({"id"=>77, "loss_cause_id"=>9, "loss_type_id"=>9})

  LossCauseType.create({"id"=>78, "loss_cause_id"=>10, "loss_type_id"=>9})

  LossCauseType.create({"id"=>79, "loss_cause_id"=>2, "loss_type_id"=>9})

  LossCauseType.create({"id"=>80, "loss_cause_id"=>11, "loss_type_id"=>9})

  LossCauseType.create({"id"=>81, "loss_cause_id"=>12, "loss_type_id"=>9})

  LossCauseType.create({"id"=>82, "loss_cause_id"=>13, "loss_type_id"=>9})

  LossCauseType.create({"id"=>83, "loss_cause_id"=>14, "loss_type_id"=>9})

  LossCauseType.create({"id"=>84, "loss_cause_id"=>15, "loss_type_id"=>9})

  LossCauseType.create({"id"=>85, "loss_cause_id"=>16, "loss_type_id"=>9})

  LossCauseType.create({"id"=>86, "loss_cause_id"=>34, "loss_type_id"=>10})

  LossCauseType.create({"id"=>87, "loss_cause_id"=>17, "loss_type_id"=>11})

  LossCauseType.create({"id"=>88, "loss_cause_id"=>19, "loss_type_id"=>11})

  LossCauseType.create({"id"=>89, "loss_cause_id"=>18, "loss_type_id"=>11})

  LossCauseType.create({"id"=>90, "loss_cause_id"=>20, "loss_type_id"=>11})

  LossCauseType.create({"id"=>91, "loss_cause_id"=>21, "loss_type_id"=>11})

  LossCauseType.create({"id"=>92, "loss_cause_id"=>31, "loss_type_id"=>11})

  LossCauseType.create({"id"=>93, "loss_cause_id"=>2, "loss_type_id"=>11})

  LossCauseType.create({"id"=>94, "loss_cause_id"=>22, "loss_type_id"=>11})

  LossCauseType.create({"id"=>95, "loss_cause_id"=>23, "loss_type_id"=>11})

  LossCauseType.create({"id"=>96, "loss_cause_id"=>24, "loss_type_id"=>11})

  LossCauseType.create({"id"=>97, "loss_cause_id"=>25, "loss_type_id"=>11})

  LossCauseType.create({"id"=>98, "loss_cause_id"=>26, "loss_type_id"=>11})

  LossCauseType.create({"id"=>99, "loss_cause_id"=>27, "loss_type_id"=>11})

  LossCauseType.create({"id"=>100, "loss_cause_id"=>28, "loss_type_id"=>11})

  LossCauseType.create({"id"=>101, "loss_cause_id"=>15, "loss_type_id"=>11})

  LossCauseType.create({"id"=>102, "loss_cause_id"=>29, "loss_type_id"=>11})

  LossCauseType.create({"id"=>106, "loss_cause_id"=>36, "loss_type_id"=>11})

  LossCauseType.create({"id"=>107, "loss_cause_id"=>36, "loss_type_id"=>6})

  LossCauseType.create({"id"=>108, "loss_cause_id"=>36, "loss_type_id"=>7})

  LossCauseType.create({"id"=>109, "loss_cause_id"=>37, "loss_type_id"=>4})

  LossCauseType.create({"id"=>110, "loss_cause_id"=>37, "loss_type_id"=>18})

  LossCauseType.create({"id"=>111, "loss_cause_id"=>37, "loss_type_id"=>7})
  ActiveRecord::Base.connection.reset_pk_sequence!('loss_cause_types')

  State.create({"id"=>1, "name"=>"AL"})

  State.create({"id"=>2, "name"=>"AK"})

  State.create({"id"=>3, "name"=>"AZ"})

  State.create({"id"=>4, "name"=>"AR"})

  State.create({"id"=>5, "name"=>"CA"})

  State.create({"id"=>6, "name"=>"CO"})

  State.create({"id"=>7, "name"=>"CT"})

  State.create({"id"=>8, "name"=>"DE"})

  State.create({"id"=>9, "name"=>"FL"})

  State.create({"id"=>10, "name"=>"GA"})

  State.create({"id"=>11, "name"=>"HI"})

  State.create({"id"=>12, "name"=>"ID"})

  State.create({"id"=>13, "name"=>"IL"})

  State.create({"id"=>14, "name"=>"IN"})

  State.create({"id"=>15, "name"=>"IA"})

  State.create({"id"=>16, "name"=>"KS"})

  State.create({"id"=>17, "name"=>"KY"})

  State.create({"id"=>18, "name"=>"LA"})

  State.create({"id"=>19, "name"=>"ME"})

  State.create({"id"=>20, "name"=>"MD"})

  State.create({"id"=>21, "name"=>"MA"})

  State.create({"id"=>22, "name"=>"MI"})

  State.create({"id"=>23, "name"=>"MN"})

  State.create({"id"=>24, "name"=>"MS"})

  State.create({"id"=>25, "name"=>"MO"})

  State.create({"id"=>26, "name"=>"MT"})

  State.create({"id"=>27, "name"=>"NE"})

  State.create({"id"=>28, "name"=>"NV"})

  State.create({"id"=>29, "name"=>"NH"})

  State.create({"id"=>30, "name"=>"NJ"})

  State.create({"id"=>31, "name"=>"NM"})

  State.create({"id"=>32, "name"=>"NY"})

  State.create({"id"=>33, "name"=>"NC"})

  State.create({"id"=>34, "name"=>"ND"})

  State.create({"id"=>35, "name"=>"OH"})

  State.create({"id"=>36, "name"=>"OK"})

  State.create({"id"=>37, "name"=>"OR"})

  State.create({"id"=>38, "name"=>"PA"})

  State.create({"id"=>39, "name"=>"RI"})

  State.create({"id"=>40, "name"=>"SC"})

  State.create({"id"=>41, "name"=>"SD"})

  State.create({"id"=>42, "name"=>"TN"})

  State.create({"id"=>43, "name"=>"TX"})

  State.create({"id"=>44, "name"=>"UT"})

  State.create({"id"=>45, "name"=>"VT"})

  State.create({"id"=>46, "name"=>"VA"})

  State.create({"id"=>47, "name"=>"WA"})

  State.create({"id"=>48, "name"=>"WV"})

  State.create({"id"=>49, "name"=>"WI"})

  State.create({"id"=>50, "name"=>"WY"})
  ActiveRecord::Base.connection.reset_pk_sequence!('states')

  InsuranceCompany.create({"bulletin_number"=>"4056-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-222-7623", "effective_date"=>"2012-03-22", "esl"=>3000, "estimating_software"=>"Xactimate 27.5", "id"=>1, "name"=>"AAA Missouri Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"Residential", "special_conditions"=>"Dispatches for AAA Missouri will appear as AAA Northern New England...  Use Xactimate Profile ACSC.", "states_involved"=>"U.S. Franchises in AL, AR, IL, IN, KS, LA, MO, and MS"})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>2, "name"=>"AAA of Carolina Group", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>3, "name"=>"AAA of Northern New England", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>4, "name"=>"AAA Southern California", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>5, "name"=>"Acadia Insurance Company", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>6, "name"=>"Acceptance Casualty Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>7, "name"=>"ACE Private Risk Services (APRS) - Residential Water Mitigation", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>nil, "collect_deductible"=>nil, "customer_service_contacts"=>nil, "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>8, "name"=>"ACE Private Risk Services (APRS) - Residential Fire & Smoke Mitigation Program", "pricing"=>nil, "property_type"=>nil, "special_conditions"=>nil, "states_involved"=>nil})

  InsuranceCompany.create({"bulletin_number"=>"4056-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-222-7623", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate 27.5", "id"=>9, "name"=>"AAA Missouri Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Dispatches for AAA Missouri will appear as AAA Northern New England..  Use Xactimate Profile ACSC.", "states_involved"=>"U.S. Franchises in AL, AR, IL, IN, KS, LA, MO, and MS"})

  InsuranceCompany.create({"bulletin_number"=>"4493-SF", "collect_deductible"=>"No, unless otherwise instructed by the Adjuster.", "customer_service_contacts"=>"1-800-974-1222 (Joanne Marinaro, Claims Manager; 704-569-7881 (Danielle Murphy)", "effective_date"=>nil, "esl"=>nil, "estimating_software"=>"Xactimate", "id"=>10, "name"=>"AAA of Carolina Group", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Verbal briefing to AAA Carolina rep or adjuster same business day, or at maximum, 24 hours of referral of claim, to include overview of job, any unusual circumstancesthat would allow AAA of Carolina to assess scope or severity of water and estimated total damages. If unable to meet guidelines, notify SERVPRO Call Center. Desiccant Dehus, Air Scrubbers, Injectidry Systems or other floor-drying systems require prior adjuster approval. Notify/get adjuster approval for: source not known or not from plumbing system insdide the home, customer service issure, pre-existing damage. If Category 1 loss changes to Category 2 or 3; if affected flooring continues through other unaffected rooms, supplements to the water-mitigation job.  Sketch/Dimennsioning: measure to the inch.", "states_involved"=>"U. S. Franchises in NC, SC"})

  InsuranceCompany.create({"bulletin_number"=>"3900-SF-3", "collect_deductible"=>"No - the deductible will be applied elsewhere on the claim.", "customer_service_contacts"=>"Northern New England:(207) 791-6140 – Keith Sproul\n(207) 791-8544 – Tonnya Sayah\n(207) 791-8540 -Pennsylvania\nRichard Weir or Michael Nanni\n(724) 836-3215, Option 2 for Claims, then Option 3.  Maine\nLaurie Dumont – (207) 776-6150 -After Hours\n(800) 672-5246; (800) 222-7623 with insured's name and claim number.", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate 27.5", "id"=>11, "name"=>"AAA of Northern New England", "pricing"=>"Use the most current price list provided by Xactimate for your area.  The use of Base Service Charges is not approved for this program.", "property_type"=>"R", "special_conditions"=>"Xactimate Profile:  ACSC     Disposal of any contents requires prior adjuster approval. A list of all contents to be removed and photos Provide the Estimator’s name and contact information during the\nverbal briefing, as well as in the opening statement of the Xactimate® Estimate. Submit a 12\" square sample of unsalvageable carpet or wood flooring to adjuster.  SEE BULLETIN FOR FIRE JOBS GUIDELINES.", "states_involved"=>"U.S. Franchises in AL, AR, IL, IN, KS, ME, MO, MS, NH, PA, and VT."})

  InsuranceCompany.create({"bulletin_number"=>"4736-SF", "collect_deductible"=>"No; the deductible will be applied elsewhere on the claim, unless otherwise instructed by the adjuster.", "customer_service_contacts"=>"Veronica Rubio, Claim Manager, Property Claims\nOffice:  714-850-5691\nMobile:  949-838-7745\nE-mail:  rubio.veronica@aaa-calif.com\n\n", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate 27.5", "id"=>12, "name"=>"AAA Southern California", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"In addition to standard photos, the following photos are required: 1) equipment placement; 2) to support the decision for demolition; 3) pre-existing damages; 4) items suspected for potential subrogation.  See bulletin for more important details.", "states_involved"=>"CA"})

  InsuranceCompany.create({"bulletin_number"=>"3873-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"During Business Hours:  800-773-4300; After Business Hours:  1-800-691-4966 (on-call adjuster).  If job is referred by a public adjuster, Franchise must notify th applicable Acadia Ins. Co. Adjuster within 48 hours.", "effective_date"=>"2012-07-02", "esl"=>10, "estimating_software"=>"Excluding subcontract work:  $100,000 or less, use Xactimate; over $100,000, use T&M; if T&M is to be used for losses under $100,000, it must be mutually agreed upon  at the time of event by Adjuster and SERVPRO Commercial Large Loss Division.  NTE Limit must be provided to adjuster within 48 hours.", "id"=>13, "name"=>"Acadia Insurance Company", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area. Base Service Charges is not approved. If T&M, use most current price list for T&M.", "property_type"=>"C ", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in CT, MA, ME, NH, NY, PA, RI, VT -Participation is contingent upon approval by Acadia Ins. Co. and SERVPRO Commercial Large Loss Division and Large Loss Response Team.  In certain instances, Acadia may make a specific request as it relates to a Large Loss Response Team member."})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>14, "name"=>"Acceptance Casualty Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4337-F", "collect_deductible"=>"No. It will be applied elsewhere on the loss.", "customer_service_contacts"=>"IF UNABLE TO REACH THE ADJUSTER, CALL:  Melissa McIntyre 908-860-4762; cell 732-991-7368.     Arpan Sikder, cell 973-856-1404", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Xactimate", "id"=>15, "name"=>"ACE Private Risk Services (APRS) - Residential Water Mitigation", "pricing"=>"Use most current price list provided by Xactimate for your area. Base Service Charges not approved.", "property_type"=>"R", "special_conditions"=>"Provide verbal briefing by phone and by email (if an email address is provided). DRYING WORKBOOK REQUIRED.  Keep flooring samples and send to ITEL if required. CONTENT MANIPULATION OR PACK-OUT MUST BE PRE-APPROVED BY ADJUSTER. Contact adjuster for referral for Dry Cleaning. IF MOLD DISCOVERED, NOTIFY ADJUSTER BY PHONE AND EMAIL.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4338-F", "collect_deductible"=>"Collect the deductible unless otherwise directed by the APRS Adjuster", "customer_service_contacts"=>"IF UNABLE TO REACH ADJUSTER, CALL:  Melissa McIntyre 908-860-4762; cell 732-991-7368.     Arpan Sikder, cell 973-856-1405", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Xactimate", "id"=>16, "name"=>"ACE Private Risk Services (APRS) - Residential Fire & Smoke Mitigation Program", "pricing"=>"Use most current price list provided by Xactimate for your area. Base Service Charges not approved.", "property_type"=>"R", "special_conditions"=>" INCLUDE IN FINAL UPLOAD PHOTOS OF CAUSE AND ORIGIN OF FIRE, IF POSSIBLE, AND OF BEFORE AND AFTER CLEANING OF ALL ROOMS. Provide verbal briefing by phone and email (if email address is provided). NO DEMOLITION OR RECONSTRUCTION WITHOUT ADJUSTER APPROVAL. TAKE PICTURES AND PROVIDE PROPER DOCUMENTION PRIOR TO.  Adjuster approval for dumpsters or pods. OBTAIN REFERRAL FROM ADJUSTER FOR DRY CLEANING.  Content manipulation of furniture inside home or Pack-Out must be pre-approved by adjuster. No multiple methods of cleaning on single item without specific adjuster approval. CONTENTS SEPARATE ESTIMATE FROM STRUCTURE. Take photos of bric-a-brac before removing from original location. Make inventory list identifying box number and contents of each box. SUBROGATION - NOTIFY ADJUSTER, TAKE PHOTOS, DO NOT DISTURB SUSPECTED ITEM. BOARD-UP AND DEBRIS REMOVAL ARE INCLUDED IN THIS PROGRAM. Notify adjuster by  phone and email if mold is discovered. WHEN TESTING IS REQUIRED BY LAW, ACE PRS WILL PAY FOR ASBESTOS TESTING, ONLY IF THE DAMAGE WILL AFFECT THE ABILITY TO PERFORM WORK ON THE LOSS.", "states_involved"=>"All U. S. States         Only Franchisees who do a minimum monthly average of $10,000 in fire/smoke work performed for a rolling 12 month period is eligible for ACE PRS Fire/Smoke jobs."})

  InsuranceCompany.create({"bulletin_number"=>"4157-F", "collect_deductible"=>"Not applicable", "customer_service_contacts"=>"Communicate/coordinate with SDA Church contact person on site at each church-owned location, as well as the assigned adjuster. Any services or monitoring during their period of worship must be coordinated with the church contact person on how to proceed.                Kevin M. Davidson, Senior Claims Examiner, Phone: 301-680-6882, Email: kdavidson@adventistrisk.org", "effective_date"=>"2012-05-09", "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>17, "name"=>"Adventist Risk Management (ARM)/Gencon Ins. Co. of VT (GICV) - insurer of Seventh-day Adventist Church", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"C ", "special_conditions"=>"1) No smoking or alcoholic beverages within 1,000 feet of the SDA Church entity building.  2) On-site staff will direct how SERVPRO Franchises should conduct themselves due to the sensitive tradition of the Church. 3) Notify the Church contact person immediately of the schedule on which work is to be performed (church meeting times must be treated with the utmost respect: sundown Friday until Sundown Saturday) Follow IICRC guidelines. Seek prior approval from the Church contact person for on-site storage containers. Move-outs must be approved by the Church contact person or assigned adjuster.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"5010-F", "collect_deductible"=>"Check with Adjuster", "customer_service_contacts"=>"Contact the SERVPRO Corporate Commercial Large Loss Division (CLLD) by phone or email at CommercialLoss@servpronet.com within 24 hours of on-site arrival for all commercial jobs, regardless of source, with a potential reserve figure over $25,000 or $50,000 for CAPA Level I or II, respectively.  Any deviation from the initial reserve in excess of 5% for these losses must be communicated to the client and copied to CLLD when identified. For LLRT and ERT members, the initial reserve required for contacting CLLD is $100,000 and $250,000, respectively.  If you get a local job, call CLLD to advise that you are on the AIG claim. Nat. Accts. Manager for this account:  Mark Bristol, phone 615-451-0600, ext. 1604", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Under 100,000, Xactimate;             Over 100,000,T&M", "id"=>18, "name"=>"AIG  ", "pricing"=>"Under 100,000, Xactimate;  Over 100,000,T&M                                      See bulletin for T&M fee schedule.", "property_type"=>"R & C", "special_conditions"=>"Applies to all SNAPA-qualified Franchises.  See the bulletin for T & M pricing. Until the full bulletin is published, follow standard guidelines for SNAPA accounts.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3644-SF", "collect_deductible"=>"NO", "customer_service_contacts"=>"Herbert Bailey/Property Manager -908-679-2949, David Lenci/Claims Supervisor - 908-679-2651", "effective_date"=>nil, "esl"=>10, "estimating_software"=>"Xactimate", "id"=>19, "name"=>"AIG Private Client Group (affialiate of Chartis Private Cleint Group)", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"Booties or protective footwear must be worn at all times while in the customer dwelling.", "states_involved"=>"U.S. Franchises in DC, DE, MD, NJ, NY, PA & VA"})

  InsuranceCompany.create({"bulletin_number"=>"3644-SF", "collect_deductible"=>"NO", "customer_service_contacts"=>"Herbert Bailey/Property Manager -908-679-2949, David Lenci/Claims Supervisor - 908-679-2652", "effective_date"=>nil, "esl"=>10, "estimating_software"=>"Xactimate", "id"=>20, "name"=>"AIU Holdings (affiliate of Chartis Private Client Group)", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"Booties or protective footwear must be worn at all times while in the customer dwelling.", "states_involved"=>"U.S. Franchises in DC, DE, MD, NJ, NY, PA & VA"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>21, "name"=>"AIX Specialty Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3616-SF-2", "collect_deductible"=>"No.  The deductible will be applied elsewhere on the claim.", "customer_service_contacts"=>"Michael T. Murray, Prop. Claims Supervisor, Phone 804-217-7358 or 855 253 2242 x 358", "effective_date"=>"2015-02-02", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>22, "name"=>"Alfa Alliance Insurance Corporation", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster in the following situations:  contents cleaning or packout is probable; pre-existing damage; demolition and reconstruction; dumsters; dry cleaner; pods; specialty items.     Board-up, debris removal, and contents are included in this program ", "states_involved"=>"U.S. Franchises in VA"})

  InsuranceCompany.create({"bulletin_number"=>"3858-SF", "collect_deductible"=>"NO", "customer_service_contacts"=>"On Call Claims Manager - 1-800-964-2532 – Prompt #3", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>23, "name"=>"Alfa Insurance – Residential – Water Mitigation Only", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AL, GA, MS"})

  InsuranceCompany.create({"bulletin_number"=>"4162SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Dept. 888-263-2924  (IL, IN, MI, OH)419-238-1010;  (CT, MA, NH, NY)781-890-1752;  (GA, NC, SC, TN, VA)770-740-8000; (AZ, CO, NM, OK, TX)972-401-3400", "effective_date"=>"2012-10-09", "esl"=>5, "estimating_software"=>"Excluding subcontract work:  $100,000 or less, use Xactimate; over $100,000, use T&M.", "id"=>24, "name"=>"All America Insurance  (subsidiary of Central Insurance)", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area.  If T&M, use most current price list for T&M.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AZ, CO, CT, GA, IL, IN, MA, MI, NC, NH, NM, NY, OH, OK, SC, TN, TX, VA"})

  InsuranceCompany.create({"bulletin_number"=>"3557-F", "collect_deductible"=>"If directions for deductible is not provided on FNOL, contact the Nationwide/Allied Claims Handler.", "customer_service_contacts"=>"Assigned Adjustter.  If not available, call 1-800-421-3535.  After-hours line:  800-285-2524.", "effective_date"=>nil, "esl"=>1, "estimating_software"=>"Xactimate", "id"=>25, "name"=>"Allied Insurance Company/Nationwide Insurance Company", "pricing"=>"Use most current price list provided by Xactimate for your area. Base Service Charges not allowed.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Use Drying Workbook. Immediately report any pre-existing damage to Claims Handler. If more than 144 sq. ft. of flooring is unrepairable, obtain sample and notify Claims Handler. Do not dispose of any items that Claims Handler has deemed salvageable. Assist with moving and storage of salvageable items from loss location to an off-site location.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>26, "name"=>"Allmerica Financial Alliance Ins.Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>27, "name"=>"Allmerica Financial Benefit Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4238-F-3", "collect_deductible"=>"No", "customer_service_contacts"=>"https://www.sso.servpronet.com/connect/national-accounts/program-participation/snapa/snapa-clients/allstate-insurance-company", "effective_date"=>"2015-09-02", "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>28, "name"=>"Allstate - Residential GHRN", "pricing"=>"Most current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4328-F", "collect_deductible"=>"No", "customer_service_contacts"=>"1-800-359-1000", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>29, "name"=>"Allstate - Commercial", "pricing"=>nil, "property_type"=>"C", "special_conditions"=>"SNAPA Acct.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4293-SF-1", "collect_deductible"=>"No", "customer_service_contacts"=>"https://www.sso.servpronet.com/connect/national-accounts/program-participation/snapa/snapa-clients/allstate-insurance-company", "effective_date"=>"2015-09-02", "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>30, "name"=>"Allstate - Residential GHRN - Midwest Region", "pricing"=>"Most current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  refer to bulletin", "states_involved"=>"IL, MN and WI"})

  InsuranceCompany.create({"bulletin_number"=>"4294-SF-2", "collect_deductible"=>"N", "customer_service_contacts"=>"https://www.sso.servpronet.com/connect/national-accounts/program-participation/snapa/snapa-clients/allstate-insurance-company", "effective_date"=>"2016-06-09", "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>31, "name"=>"Allstate New York Region GHRN Program", "pricing"=>"Most current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct. refer to bulletin", "states_involved"=>"NY"})

  InsuranceCompany.create({"bulletin_number"=>"4417-SF-3", "collect_deductible"=>"No", "customer_service_contacts"=>"https://www.sso.servpronet.com/connect/national-accounts/program-participation/snapa/snapa-clients/allstate-insurance-company", "effective_date"=>"2016-08-08", "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>32, "name"=>"Allstate - Residential GHRN - N. Central Region", "pricing"=>"Most current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  refer to bulletin", "states_involved"=>"IN, MI, OH"})

  InsuranceCompany.create({"bulletin_number"=>"4297-SF-1", "collect_deductible"=>"No", "customer_service_contacts"=>"https://www.sso.servpronet.com/connect/national-accounts/program-participation/snapa/snapa-clients/allstate-insurance-company", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>33, "name"=>"Allstate West Central Region GHRN Bulletin", "pricing"=>"Most current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct. refer to bulletin", "states_involved"=>"CO, MO, KS, IA, MT, ND, NE, SD, WY"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-877-263-7890", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>34, "name"=>"America First", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-877-263-7890", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>35, "name"=>"America First ", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"3337F", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims 1-800-652-1262;  Renee’ Collins - Claims Manager Choice Product 770-763-1385 or 800-326-2845 x 11385\n(770)763-1385", "effective_date"=>"2008-03-04", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>36, "name"=>"American Bankers (subsidiary of Assurant Specialty Property)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"If refusal of service, contact adjuster immediately and communicate scope of repairs; attempt to take photos of building and loss.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3892-F", "collect_deductible"=>"No.", "customer_service_contacts"=>"Claims 1-800-285-2524;                                                           Paul Swank 1-800-453-8610", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>37, "name"=>"American Claims Management & Arrowhead Insurance Agency", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"DryBook Mobile.  High level of communication with adjuster required.  Packout, Contents Cleaning, Demolition must be approved by adjuster. If after hours, only demolition immediately necessary as part of initial drying should be performed. If adjuster requests contents inventory, use POI. No referrals to other vendors. See bulletin for Commercial, Storm, or CAT jobs.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4124-SF-3", "collect_deductible"=>"NO, unless directed by the adjuster to do so. Confirm with adjuster during initial verbal briefing.", "customer_service_contacts"=>"1-800-692-6326", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>38, "name"=>"American Family Residential & Commercial Farm/Ranch", "pricing"=>"Franchisee must use the price list downloaded with the assignment. Franchisees must\napply a 5% discount to the Xactimate® pricing for the Equipment included in Attachment 1- Qualified\nEquipment Discount List (by Xactimate® Line Item & Description)", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Drying Workbook required. Authorization required for any demolition over and above removal of baseboards and carpet pad. Contact adjuster if packout or dry cleaning is needed. Specialty Drying Equipment requires prior approval from adjuster. Sketch/Dimensioning - Measure to the inch. Photos required of all non-restorable items. If an item is suspected as potential subrogation, utilize the Am. Fam. Potential Subrogation Form. ", "states_involved"=>"U. S. STATES OF:  AZ, CO, GA, ID, IA, IL, IN, KS, MN, MO, ND, NE, NV, OH, OR, SD, UT, WA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>39, "name"=>"American Guarantee and Liability (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3794-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"800--486-5616", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>40, "name"=>"American Hallmark Insurance Co. of Texas (subsidiary of Hallmark Insurance)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. States of:  AZ, AR, CO, GA, ID, IL, IN, KS, KY, MS, MO, MT, NE, NV, NM, OK, OR, SC, TX, UT, WA, WY"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>41, "name"=>"American Insurance (subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3199-F-2", "collect_deductible"=>"Yes - on mitigation jobs only.", "customer_service_contacts"=>"Calif. - 909-919-7050 x21907; FL & GA -800-987-6000 x63225; AZ,IIL ,NV, OK & TX - 512-241-4162 x44162; PA, NY, NJ, VA - 800-987-2032 x60039", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 27.5", "id"=>42, "name"=>"American Mercury Ins. Co.                                           American Mercury Lloyd's Insurance                                                 (subsidiaries of Mercury Ins. Co.)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct. - UTILIZE DRYBOOK. Do not solicit or refer any resoration work beyond mitigation.  Only if the insured initiates such discussion, should Franchisee discuss their capabilities beyond mitigation services.  PHOTOS: In addition to standard, include pre- and post-mitigation for all affected rooms with overview of eqipment and contents; post-mitigation photos after equipment removal. Lift and dry carpet if it can be saved. Reinstall saved carpet. If carpet cannot be saved, lift and remove carpet and leave 12\" square sample of carpet and pad at insured's for adjuster. Contact adjuster if: contents cleaning or packout is probable (must obtain adjuster approval and put on separate estimate), plumbing leakage appearing to have occurred over 24-hours, policyholder request bid for other than emergency water mitigation.  If restoration and/or reconstruction is appvd. by adjuster and insured, complete Xactimate estimate separate from mitigation. Documented appvl from adjuster must be received prior to commencing any restoration services. All contact with insureds must be time stamped and reported in SERVPRO's management reporting system.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4980-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"1-800-425-9113, Colleen Schilling, ext. 6210", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>43, "name"=>"American Platinum Prop. & Cas. (subsidiary of Universal Prop. & Cas.)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"DE, FL, GA, HI, IN, MD, MA, MI, MN, NC, PA, SC"})

  InsuranceCompany.create({"bulletin_number"=>"3337F", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims 1-800-652-1262;  Renee’ Collins - Claims Manager Choice Product 770-763-1385 or 800-326-2845 x 11385\n(770)763-1385", "effective_date"=>"2008-03-04", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>44, "name"=>"American Reliable (subsidiary of Assurant Specialty Property)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"If refusal of service, contact adjuster immediately and communicate scope of repairs; attempt to take photos of building and loss.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3337F", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims 1-800-652-1262;  Renee’ Collins - Claims Manager Choice Product 770-763-1385 or 800-326-2845 x 11385\n(770)763-1385", "effective_date"=>"2008-03-04", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>45, "name"=>"American Security Insurance (subsidiary of Assurant Specialty Property)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"If refusal of service, contact adjuster immediately and communicate scope of repairs; attempt to take photos of building and loss.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4064-SF", "collect_deductible"=>"Contact the Adjuster whether to collect the deductible.", "customer_service_contacts"=>"Westfield Insurance Customer Care Center: Phone 866-937-2663, Corry Novosel: Phone 724-776-7200", "effective_date"=>"2012-03-04", "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>46, "name"=>"American Select (affiliate of Westfield Insurance)", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use price list attached to bulletin.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Contact adjuster immediately and obtain direction on how to proceed if content cleaning or packout is involved (not included in this program). Water mitigation performed solely in conjunction with fire/smoke job should be included in fire/smoke estimate.  Use DRYING WORKBOOK.", "states_involved"=>"U. S. Franchises in AZ, CO, DE, FL, GA, IL, IN, IA, KY, MD, MI, MN, NM, NC, OH, PA, SC, TN, VA, WV, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>47, "name"=>"American Standard Lloyds (subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3315-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Local Adjuster or call (845)534-8749.", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>48, "name"=>"American Traditions Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in FL"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>49, "name"=>"American Zurich (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>50, "name"=>"Ananke Re Ltd. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"3712-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Ellen Wyrick - 1-800-255-0193, Ext. 4372", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>51, "name"=>"Armed Forces Insurance", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>52, "name"=>"Associates Indemnity (subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4277-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"During Business Hours: Call Assigned Adjuster or one of these branch offices: Atlanta, GA, 800-767-4080;  Austin, TX, 800-252-9641;  Columbia, MO, 800-877-3579;  Omaha, NE, 800-877-4245;  Salina, KS, 800-998-8902\nAfter-Hours: John Killough, Phone 615-426-2664 (AFG Claims Service)", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>53, "name"=>"Association Casualty Insurance (affiliate of Columbia Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Contact Columbia Ins. Adjuster immediately in these cases: If insured wants to delay any part of the 1/4/8 procedure for an after-hours assignment; if an insured wants to cancel the claim prior to inspection; if an insured want to cancel the claim during initial deployment. Complete as much of Initial Report as possible. Take photos of risk if allowable by policyholder.  Protect salvageable items and leave on site. If removal is necessary, communicate with adjuster. Secure and leave undisturbed any area where cause and origin of loss by suspected subrogation.", "states_involved"=>"U. S. Franchises in AL, FL, GA, IL, IA, KS, KY, LA, MS, MO, NE, NM, NC, OK, SC, SD, TN, TX"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>54, "name"=>"Assurance Company of America (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3337F", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims 1-800-652-1262;  Renee’ Collins - Claims Manager Choice Product 770-763-1385 or 800-326-2845 x 11385\n(770)763-1385", "effective_date"=>"2008-03-04", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>55, "name"=>"Assurant Specialty PropertyInsurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"If refusal of service, contact adjuster immediately and communicate scope of repairs; attempt to take photos of building and loss.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4409-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"Claims:  540-885-5127", "effective_date"=>"2013-06-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>56, "name"=>"Augusta Mutual Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"If mold is discovered, contact adjuster for direction on mitigation and payment process.  DRYING WORKBOOK REQUIRED ON ALL WATER LOSSES..Contact the adjuster before testing, disturbing, or moving any building materials.", "states_involved"=>"U. S. State of Virginia"})

  InsuranceCompany.create({"bulletin_number"=>"5074-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1) Contact assigned adjuster.  2) Mon.-Fri.7:30am-9:30pm, Sat.-Sun.8:00am-6:30pm EST Phone 1-800-252-4626", "effective_date"=>"2016-10-10", "esl"=>0, "estimating_software"=>"Xactimate ", "id"=>57, "name"=>"Auto-Owners Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Services not included within this agreement, but may be available upon request: structural construction or reconstruction services, asbestos or lead abatement, hazardous cleanup, non-covered losses.", "states_involved"=>"AL, AZ, AR, CO, FL, GA, ID, IL, IN, IA, KS, KY, MI, MN, MO, NE, NC, ND, OH, PA, SC, SD, TN, UT, VA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4102-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>58, "name"=>"Beacon National and Beacon Lloyds (affiliates of State Auto)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3640-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Bob Morgan, Property Claims Supervisor\nPhone: 617-956-1791", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>59, "name"=>"Bunker Hill Insurance - Water Mitigation", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in CT, MA "})

  InsuranceCompany.create({"bulletin_number"=>"4177SF", "collect_deductible"=>"Check with Adjuster", "customer_service_contacts"=>"Customer Service, Available Mon-Fri 8am- 5pm, Phone 866-322-2442 - Bob Morgan, Property Claims Supervisor, Phone (617)956-1791", "effective_date"=>"2012-04-10", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>60, "name"=>"Bunker Hill Insurance Fire and Smoke Mitigation Program", "pricing"=>"Utilize the most current contractor profile in Xactimate for your area. Base Service Charges only w/Adjuster approval.", "property_type"=>"R", "special_conditions"=>"Upon receipt of job referral, notify Bunker Hill of Franchise name and phone number that is assigned to the loss. See bulletin for all other requirements.", "states_involved"=>"U.S. Franchises in CT, MA - Special selection criteria includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"3629-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"During normal business hours, contact the California Casualty Adjuster assigned to the claim. For after-hours, refer to Contact Numbers attached to the bulletin.", "effective_date"=>"2010-03-03", "esl"=>2, "estimating_software"=>"Scanner or Xactimate", "id"=>61, "name"=>"California Casualty Insurance", "pricing"=>"Use the most current price list for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3854-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Phone 816-632-6511                Kent Peterson 573-442-6441;          cell 660-888-2290                                 Craig Koenig 417-881-1176                                             ", "effective_date"=>"2014-10-11", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>62, "name"=>"Cameron Insurance Companies (Cameron Mutual)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Cameron Insurance Companies will issue the check payable to mortgagee, insured, and the Franchise and mail to the Franchise within 30 days.", "states_involved"=>"U.S. Franchises in AR, IA, MO"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>63, "name"=>"Campmed Cas. and Indemnity Co. Inc. of MD (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4493-SF", "collect_deductible"=>"No, unless otherwise instructed by the Adjuster.", "customer_service_contacts"=>"1-800-974-1222 (Joanne Marinaro, Claims Manager; 704-569-7881 (Danielle Murphy)", "effective_date"=>nil, "esl"=>nil, "estimating_software"=>"Xactimate", "id"=>64, "name"=>"Carolina Motor Club (AAA of Carolina Group)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Verbal briefing to AAA Carolina rep or adjuster same business day, or at maximum, 24 hours of referral of claim, to include overview of job, any unusual circumstancesthat would allow AAA of Carolina to assess scope or severity of water and estimated total damages. If unable to meet guidelines, notify SERVPRO Call Center. Desiccant Dehus, Air Scrubbers, Injectidry Systems or other floor-drying systems require prior adjuster approval. Notify/get adjuster approval for: source not known or not from plumbing system insdide the home, customer service issure, pre-existing damage. If Category 1 loss changes to Category 2 or 3; if affected flooring continues through other unaffected rooms, supplements to the water-mitigation job.  Sketch/Dimennsioning: measure to the inch.", "states_involved"=>"U. S. Franchises in NC, SC"})

  InsuranceCompany.create({"bulletin_number"=>"4488-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"1-800-686-3011, Option 6", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>65, "name"=>"Casco Indemnity (subsidiary of Ohio Mutual)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"CT, IN, ME, NH, OH, RI, VT"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>66, "name"=>"CastlePoint National Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"3860-F-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-228-6108                                                                                  Mark Greenwald ext. 2406                                                       Travis Unzicker ext. 2410                                                               Tony Laughlin ext 2409                                                                 After Hours: Mark Greenwald, 402-415-7185                    Also, see contact list attached to bulletin.", "effective_date"=>"2015-07-12", "esl"=>5000, "estimating_software"=>"Excluding subcontract work:  $100,000 or less, use Xactimate; over $100,000, use T&M.", "id"=>67, "name"=>"Catholic Mutual", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area.  If T&M, use most current price list for T&M.", "property_type"=>"C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4260-SF-2", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims (toll free): 1-866-215-7574 (24 hours a day, 7 days a week)\nTom Cattell, Claims Supervisor, 1-866-215-7574, ext. 2321", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>68, "name"=>"Centauri Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area. Base Services Charges must be approved by adjuster.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AL, FL, LA, MS, SC, TX"})

  InsuranceCompany.create({"bulletin_number"=>"4162SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Dept. 888-263-2924  (IL, IN, MI, OH)419-238-1010;  (CT, MA, NH, NY)781-890-1752;  (GA, NC, SC, TN, VA)770-740-8000; (AZ, CO, NM, OK, TX)972-401-3400", "effective_date"=>"2012-10-09", "esl"=>5, "estimating_software"=>"Excluding subcontract work:  $100,000 or less, use Xactimate; over $100,000, use T&M.", "id"=>69, "name"=>"Central Insurance (Central Mutual)", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area.  If T&M, use most current price list for T&M.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in AZ, CO, CT, GA, IL, IN, MA, MI, NC, NH, NM, NY, OH, OK, SC, TN, TX, VA"})

  InsuranceCompany.create({"bulletin_number"=>"3644-SF", "collect_deductible"=>"NO", "customer_service_contacts"=>"Herbert Bailey/Property Manager -908-679-2949, David Lenci/Claims Supervisor - 908-679-2651", "effective_date"=>nil, "esl"=>10, "estimating_software"=>"Xactimate", "id"=>70, "name"=>"Chartis Private Client Group/AIG Private Client Group/AIU", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"Booties or protective footwear must be worn at all times while in the customer dwelling.", "states_involved"=>"U.S. Franchises in DC, DE, MD, NJ, NY, PA & VA"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>71, "name"=>"Chicago Insurance (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3392-F", "collect_deductible"=>"Collect the deductible for mitigation-only losses. Losses requiring more tha mitigation, Chubb will appply the deductible elsewhere on the claim.", "customer_service_contacts"=>"Assigned adjuster; if unknown, contact 1-800-252-4670 ext. 4670 to request assigned adjuster.", "effective_date"=>"2008-04-11", "esl"=>7, "estimating_software"=>"Xactimate", "id"=>72, "name"=>"Chubb Group", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Use ATP #28001.    Do not use ATP #28000.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3816-F", "collect_deductible"=>"Not applicable", "customer_service_contacts"=>"Business Hours: Dylan MacLeod at Sedgwick, Phone 801-258-9715                                                 After Hours: Frontier Adjusters: Ray Basham, Matt Basham, or Mike Basham:  800-599-8926 or 801-599-8926", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Excluding subcontract work:  $100,000 or less, use Xactimate; over $100,000, use T&M.", "id"=>73, "name"=>"Church of Jesus Christ of Latter-day Saints", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area.  If T&M, use most current price list for T&M.", "property_type"=>"C", "special_conditions"=>"No smoking or alcoholic beverages within 1,000 ft. of any ward/church/temple. Communicate/coordinate with Facilities Manager on site at each church-owned location. Any potential subrogation, immediately notify Dylan MacLeon at Sedgwick. Notify Facilites Mgr. immediately if work is to be performed on  a Sunday. Seek prior approval from Facilities Mgr. for on-site storage containers or move-outs.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3697-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-554-2642", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>74, "name"=>"Church Mutual Insurance", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4093-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Contact the assigned Claim Representative or Agent. If unknown, call 877-242-2544", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>75, "name"=>"Cincinnati Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AL, AZ, AR, CO, CT, DE, FL, GA, ID , IL, IN, IA, KS, KY, MD, MI, MN, MO, MT, NE, NH, NM, NY, NC, ND, OH, OR, PA, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY."})

  InsuranceCompany.create({"bulletin_number"=>"4277-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"During Business Hours: Call Assigned Adjuster or one of these branch offices: Atlanta, GA, 800-767-4080;  Austin, TX, 800-252-9641;  Columbia, MO, 800-877-3579;  Omaha, NE, 800-877-4245;  Salina, KS, 800-998-8902\nAfter-Hours: John Killough, Phone 615-426-2664 (AFG Claims Service)", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>76, "name"=>"Citizens Mutual Insurance (affiliate of Columbia Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Contact Columbia Ins. Adjuster immediately in these cases: If insured wants to delay any part of the 1/4/8 procedure for an after-hours assignment; if an insured wants to cancel the claim prior to inspection; if an insured want to cancel the claim during initial deployment. Complete as much of Initial Report as possible. Take photos of risk if allowable by policyholder.  Protect salvageable items and leave on site. If removal is necessary, communicate with adjuster. Secure and leave undisturbed any area where cause and origin of loss by suspected subrogation.", "states_involved"=>"U.S. Franchises in AL, FL, GA, IL, IA, KS, KY, LA, MS, MO, NE, NM, NC, OK, SC, SD, TN, TX"})

  InsuranceCompany.create({"bulletin_number"=>"4162SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Dept. 888-263-2924  (IL, IN, MI, OH)419-238-1010;  (CT, MA, NH, NY)781-890-1752;  (GA, NC, SC, TN, VA)770-740-8000; (AZ, CO, NM, OK, TX)972-401-3400", "effective_date"=>"2012-10-09", "esl"=>5, "estimating_software"=>"Excluding subcontract work:  $100,000 or less, use Xactimate; over $100,000, use T&M.", "id"=>77, "name"=>"CMI Lloyds (subsidiary of Central Insurance)", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area.  If T&M, use most current price list for T&M.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AZ, CO, CT, GA, IL, IN, MA, MI, NC, NH, NM, NY, OH, OK, SC, TN, TX, VA"})

  InsuranceCompany.create({"bulletin_number"=>"4581-F", "collect_deductible"=>"Do not collect deductibles unless directed to do so by CNA Claims Rep.", "customer_service_contacts"=>"1-877-262-2727", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Excluding subcontract work:  $50,000 or less, use Xactimate; over $50,000, use CNA T&M CONTRACTED PRICING.", "id"=>78, "name"=>"CNA Commercial Insurance", "pricing"=>"If Xactimate, use most current price list provided by Xactimate for your area.  If T&M, use most CNA CONTRACTED T&M PRICING.", "property_type"=>"C", "special_conditions"=>"If Franchise is not LLRT or ERT qualified, contact SERVPRO Commercial Large Loss Dept. for jobs that will exceed $50,000, less subcontract. Contact policyholder within 30 min. of receipt of referral. If contact cannot be made with customer within one hour, contact CNA rep. by phone or fax. Contact adjuster if contents cleaning or packout is probable, if plumbing leakage appears to have occurred over more than a 24hr. period, if disposal of any personal property items owned or controlled by insured. if utilization of subcontractor for non-mitigation services (safety fencing, dumpsters, portable toilets, security guards, etc.). Follow Code of Conduct attached to the bulletin. Franchisees will have multi-lingual capabilities available when needed at local level. Seek prior approval from CNA if additional multi-lingual services are required to complete services.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>79, "name"=>"Colonial American Cas. And Surety (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-888-298-3778", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>80, "name"=>"Colorado Casualty", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-888-298-3778", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>81, "name"=>"Colorado Casualty", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4277-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"During Business Hours: Call Assigned Adjuster or one of these branch offices: Atlanta, GA, 800-767-4080;  Austin, TX, 800-252-9641;  Columbia, MO, 800-877-3579;  Omaha, NE, 800-877-4245;  Salina, KS, 800-998-8902\nAfter-Hours: John Killough, Phone 615-426-2664 (AFG Claims Service)", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>82, "name"=>"Columbia Insurance (Columbia Mutual, Columbia National)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Contact Columbia Ins. Adjuster immediately in these cases: If insured wants to delay any part of the 1/4/8 procedure for an after-hours assignment; if an insured wants to cancel the claim prior to inspection; if an insured want to cancel the claim during initial deployment. Complete as much of Initial Report as possible. Take photos of risk if allowable by policyholder.  Protect salvageable items and leave on site. If removal is necessary, communicate with adjuster. Secure and leave undisturbed any area where cause and origin of loss by suspected subrogation.", "states_involved"=>"U.S. Franchises in AL, FL, GA, IL, IA, KS, KY, LA, MS, MO, NE, NM, NC, OK, SC, SD, TN, TX"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>83, "name"=>"Companion Commercial Ins. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>84, "name"=>"Companion Property & Casualty Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"3405-SF", "collect_deductible"=>"does not apply", "customer_service_contacts"=>"Brenda Gillis 203-946-3751    Bruce Clinger 203-946-3749", "effective_date"=>"2008-10-11", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>85, "name"=>"Connecticut Conference of Municipalities/Connecticut Interlocal Risk Management Agency (CIRMA)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in CT"})

  InsuranceCompany.create({"bulletin_number"=>"3808-SF", "collect_deductible"=>"No; however, discuss with adjuster if loss appears to be mitigation only.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Charles Strube, Claims Supervisor, Phone 503-723-6311\n3) 1-866-COUNTRY (1-866-268-6879).", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>86, "name"=>"COUNTRY Mutual/COUNTRY PREFERRED/COUNTRY CASUALTY", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook on Residential, Monitoring/Inspectiion Report on Commercial. Packout, Contents Cleaning, or Demolition requires prior adjuster approval. If after hours, only demo which is immediately necessary as part of initial drying plan shoud be performed.", "states_involved"=>"U.S. Franchises in OR and Southwest WA"})

  InsuranceCompany.create({"bulletin_number"=>"4066-SF-2", "collect_deductible"=>"NO", "customer_service_contacts"=>"New Jersey: 1-866-794-6398 Pennsylvania, Maryland, Delaware: 1-866-794-6399", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work. Adjuster must be notified if job will exceed $100,000 and document in job file.", "id"=>87, "name"=>"Cumberland Insurance Group - Water/Fire/Smoke Mitigation", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R & C", "special_conditions"=>"Notify Adjuster/Analyst if packout will exceed $2,000,  and prior to any demoliton. Use Drying Workbook on water mitigation jobs and on fire jobs that require water mitigation.  USE AUTHORIZATION TO PERFORM SERVICES FORM 28001. Upload local jobs.  SEE BULLETIN FOR SPECIFIC INSTRUCTIONS ON WATER, FIRE, AND COMMERCIAL JOBS.", "states_involved"=>"U.S. Franchises in DE, MD, NJ, PA"})

  InsuranceCompany.create({"bulletin_number"=>"4178-SF", "collect_deductible"=>"NO", "customer_service_contacts"=>"New Jersey: 1-866-794-6398 Pennsylvania, Maryland, Delaware: 1-866-794-6399", "effective_date"=>"2012-04-10", "esl"=>0, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work. Adjuster must be notified if job will exceed $100,000 and document in job file.", "id"=>88, "name"=>"Cumberland Insurance Group - Fire/Smoke", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R & C", "special_conditions"=>"Upon receipt of job referral, notify Cumberland Insurance of Franchise Name and Phone Number that is assigned to the loss. Take pictures of cause and origin of fire if possible.  Do not exceed $10,000 without adjuster approval. Obtain adjuster approval if packout will exceed $2,000. If demolition will be involved. If Bric-a-Brac involved, take photos before removing items from original location. Make inventory list that identifies box number and contents.", "states_involved"=>"U.S. Franchises in DE, MD, NJ, PA - Special selection criteria includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"3966-SF", "collect_deductible"=>"Yes, if mitigation only.  If structure or contents involved, contact Adjuster to have deductible applied to that portion of claim.", "customer_service_contacts"=>"Florida Customers call 1-888-352-9773\nTexas Customers call 1-888-892-9773", "effective_date"=>"2011-02-09", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>89, "name"=>"Cypress Property & Casualty / Cypress Texas Lloyds", "pricing"=>"Most current price list provided by Xactimate for your area", "property_type"=>"R", "special_conditions"=>"No Mold remediation wil be performed until Representative/Adjuster has reviewed loss. Get written adjuster approval prior to starting mold remediation services.", "states_involved"=>"U.S. Franchises in FL, TX"})

  InsuranceCompany.create({"bulletin_number"=>"4141-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Larry Lentine, 860-887-3553 x 4346", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>90, "name"=>"Danbury Insurance Company (subsid. Of New London County Mutual)", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook. Take readings daily.  Obtain adjuster approval to monitor on holidays and weekends. Do not use ITEL or any other vendor without approval of New London County Insurance Adjuster. Additional conditions to notify adjuster: 1) if packout will exceed $2,000; 2) prior to any demolition.", "states_involved"=>"U. S. States of CT, ME, MA, NH, RI"})

  InsuranceCompany.create({"bulletin_number"=>"4087-F-2", "collect_deductible"=>"No. Will be applied elsewhere on claim. Adjuser will notify Franchise within 72 hours on how to apply deductible.", "customer_service_contacts"=>"1-800-342-5342", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.       Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>91, "name"=>"Electric Insurance - Water/Fire/Smoke Mitigation", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R", "special_conditions"=>"Adjuster approval: if packout will exceed $2,000; prior to any demolition, if unable to do Initial Upload with 2 business days from dispatch.  See bulletin for other important information.", "states_involved"=>"All U. S. States - Special selection criteria includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>92, "name"=>"Empire Fire & Marine (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>93, "name"=>"Empire Indemnity (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4245-F-3", "collect_deductible"=>"No", "customer_service_contacts"=>"See Bulletin for contact information for each region", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>94, "name"=>"Encompass Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.   Encompass does NOT allow notes in the Opening Statement of the Estimate. All notes must be\ninput into the Job Diary of the DryBook AND Xactanalysis Notes.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3865-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Tim Engman, Mutual of Enumclaw\nPhone: 360-825-2591, ext. 3254\n800-366-5551                                                                                                 If safety or health issues or cause of loss is different than reported, contact After Hours Line 866-924-3036", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>95, "name"=>"Enumclaw Insurance Group", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Adjuster approval is required for packout or contents cleaning or demolition.", "states_involved"=>"U.S. Franchises in ID, OR, UT, WA"})

  InsuranceCompany.create({"bulletin_number"=>"3842-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Contact assigned adjuster. If unknown, call Erie Ins. 24/7 line:  1-800-367-3743", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"ScanER", "id"=>96, "name"=>"Erie Insurance - Residential", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R", "special_conditions"=>"If contents are removed, provide a detailed inventory list to Erie Insurance. Notify adjuster if contents cleaning is likely or loss requires use of large desiccant dehumidifiers.", "states_involved"=>"U.S. Franchises in DC, IL, IN, MD, NC,\nNY, OH, PA, TN, VA, WI, & WV"})

  InsuranceCompany.create({"bulletin_number"=>"3843-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"If contents are removed, provde a detailed inventory list to Erie. ", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"ScanER for Commercial Water Jobs;  Xactimate for Commercial Fire Jobs (water mitigation performed solely as a result of a Commercial Fire job should be included in one Xactimate estimate).  Jobs with initial scope reserve under $100,000 will be done in Xactimate.  At time of initial inspection, if job is determined to exceed $100,000, excluding subcontract work, use Time and Material Pricing.", "id"=>97, "name"=>"Erie Insurance - Commercial and Large Loss", "pricing"=>"Use most current list for your area.", "property_type"=>"Commercial and Large Loss", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in DC, IL, IN, MD, NC,\nNY, OH, PA, TN, VA, WI, & WV"})

  InsuranceCompany.create({"bulletin_number"=>"4102-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>98, "name"=>"Farmers Casualty (affiliate of State Auto)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4915-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"Hours:  8:00am-4:00pm, Mon.-Fri.          Claims:  800-498-0954                                  After Hours:  609-579-0300  ", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>99, "name"=>"Farmers Mut. Fire Ins. Co. of Salem County", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"MD, NJ"})

  InsuranceCompany.create({"bulletin_number"=>"2925-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"800-226-3224", "effective_date"=>"2005-09-03", "esl"=>2, "estimating_software"=>"ScanER", "id"=>100, "name"=>"FCCI Insurance", "pricing"=>"Use most current list for your area.", "property_type"=>"C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AL, AR, FL, GA, IL, IN, KY, LA, MI, MS, NC, OH, SC, TN"})

  InsuranceCompany.create({"bulletin_number"=>"4007-F-3", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Contact local adjuster; if unknown, call 1-888-333-4949.", "effective_date"=>"2015-01-06", "esl"=>0, "estimating_software"=>"Xactimate", "id"=>101, "name"=>"Federated Insurance - Revision", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>102, "name"=>"Fidelity and Deposit Company of Maryland (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F-2", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate for all U.S. States", "id"=>103, "name"=>"Fireman’s Fund Insurance Company", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3407-F-3", "collect_deductible"=>"No", "customer_service_contacts"=>"\nJavier Alvarez 714-560-7829; PaolaLagunas 714-569-2824;  Robert Dalton 714-560-7811;  jaalvarez@firstam.com   sreilly@firstam.com   rddalton@firstam.com  IF SPECIALTY DRYING EQUIPMENT, CONTACT JAVIER ALVAREZ.  ", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>104, "name"=>"First American Specialty/First American Property & Casualty", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4724-SF", "collect_deductible"=>"Yes.   ", "customer_service_contacts"=>"Kimberly Dular, Claims Manager, kdular@fmicnc.com; phone 855- FMIC-855 or 919-938-6733", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate uploaded through ScanER XL", "id"=>105, "name"=>"First Mutual Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Use DryBook Mobile. Notify adjuster if: contents cleaning or pack-out is probable, pre-existing damage, demolition; if source of loss is different from  reported/provided in the loss referral; if source is not known or not from plumbing system inside the home (possible ground water, flood, roof leak); if there is customer service issue or dispute in repairs with homeowner; if dry cleaning needed, ,f CAT 1 loss changes to a CAT 2 or CAT 3 .Written or verbal auth. is required for any demolition that might be required over and above removal of baseboards and carpet pad (such as removal of drywall, wood or laminate flooring, and built-in cabinets. Extent of required demolitiion should be discussed with First Mutual rep. or adjuster; documentation of approval must be noted in the file. Photos required for all non-restorable items. If insured will not authorize any mitigation work nor allow access to premises, ask policyholder to sign Refusal of Service form. MEASURE TO THE INCH. Desiccant dehus, air scrubbers, injectidry systems or other floor-drying systems require prior approval from adjuster. ", "states_involved"=>"NC, SC, TN"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>106, "name"=>"First State Ins. Co. - FOLLOW THE HARTFORD GUIDELINES", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3582-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"(904) 312-5500\n(888) 486-4663 (toll free)", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactmate", "id"=>107, "name"=>"Florida Family Insurance", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"Franchise must send e-ViewER® and\ninvoice to the adjuster to initiate payment. Florida Family will issue the check directly to\nthe Franchise within thirty (30) days, with insured and Franchise as co-payees.", "states_involved"=>"U.S. Franchises in FL"})

  InsuranceCompany.create({"bulletin_number"=>"4277-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"During Business Hours: Call Assigned Adjuster or one of these branch offices: Atlanta, GA, 800-767-4080;  Austin, TX, 800-252-9641;  Columbia, MO, 800-877-3579;  Omaha, NE, 800-877-4245;  Salina, KS, 800-998-8902\nAfter-Hours: John Killough, Phone 615-426-2664 (AFG Claims Service)", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>108, "name"=>"Georgia Casualty (affiliate of Columbia Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Contact Columbia Ins. Adjuster immediately in these cases: If insured wants to delay any part of the 1/4/8 procedure for an after-hours assignment; if an insured wants to cancel the claim prior to inspection; if an insured want to cancel the claim during initial deployment. Complete as much of Initial Report as possible. Take photos of risk if allowable by policyholder.  Protect salvageable items and leave on site. If removal is necessary, communicate with adjuster. Secure and leave undisturbed any area where cause and origin of loss by suspected subrogation.", "states_involved"=>"U. S. Franchises in AL, FL, GA, IL, IA, KS, KY, LA, MS, MO, NE, NM, NC, OK, SC, SD, TN, TX"})

  InsuranceCompany.create({"bulletin_number"=>"3542-SF", "collect_deductible"=>"NO", "customer_service_contacts"=>"Paul Miller\n706-575-0995", "effective_date"=>"2009-12-08", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>109, "name"=>"Georgia Farm Bureau", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"Franchise will send e-ViewER® and\ninvoice to the adjuster. Georgia Farm Bureau will issue the check directly to the\nFranchise within 30 days, with insured as co-payee.", "states_involved"=>"U.S. Franchises in GA"})

  InsuranceCompany.create({"bulletin_number"=>"3970-F", "collect_deductible"=>"Collect deductible on mitigation-only jobs. Jobs that require more than mitigation, GeoVera will apply the deductible elsewhere on the claim.", "customer_service_contacts"=>"Holly Wolf, Prop. Claims Mgr. for AL, GA, NC, SC, FL, VA;  850-219-5801; after hours 800-785-3085;                                  Pat Power, Claims Mgr. for CA, WA, OR, TX, OK, AR, KS, MO, AZ; 707-863-3748; after hours 800-785-3230\n\n", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate; a separate Xactimate estimate is required for approved mold remediaton services.", "id"=>110, "name"=>"GeoVera Holdings, Inc./GeoVera Specialty Insurance/GeoVera Insurance", "pricing"=>"Use the most current price list provided by XactimateÒ for your area", "property_type"=>"R", "special_conditions"=>"Contact Adjuster immediately if insured refuses service; attempt to take photos of building and loss. Call after hours when safety or health issue or if cause of loss is differet than initially reported. Contact adjuster if potential salvage exists, packout, contents cleaning, demolition. Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3967-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"1-800-392-2202", "effective_date"=>"2011-02-09", "esl"=>2, "estimating_software"=>"Xactimate 27.3", "id"=>111, "name"=>"Germania Insurance (Germania Farm Mutual Ins. Assn. GFMIA, Germania Select Ins., Germania Fire & Casualty)", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>"Germania Insurance requires utilization of the Drying Workbook on all residential\nwater losses.", "states_involved"=>"U. S. Franchises in TX"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>112, "name"=>"GNIC of CT (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-238-3085", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>113, "name"=>"Golden Eagle", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-800-238-3085", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>114, "name"=>"Golden Eagle", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3382-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Western Region (Western WA, OR, CA, CO, and WY) Local: 206-448-4911 Toll-Free: 800-247-2643.   Eastern Region (Eastern WA and ID) Local 509-924-7039,  Toll Free 800-824-2702.  Claims 800-826-3397\n", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"ScanER", "id"=>115, "name"=>"Grange Insurance Group   (Grange Ins. Assn.)", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in CA, CO, ID, OR, WA, and WY."})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>116, "name"=>"Guaranty National (subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3762-F-2", "collect_deductible"=>"No, the deductible will be applied elsewhere on the claim.", "customer_service_contacts"=>"24-hour GuideLine 888-748-4326", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>117, "name"=>"GuideOne", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"The GuideOne Authorization for Direction of Payment Form may be used.  Use DRYING WORKBOOK on residential losses.  If water-damaged carpet is not salvageable, communicate with the adjuster whether to leave a 12\" square sample at the property or send to ITEL.  Local residential and commercial jobs are to be uploaded.  NO INITIAL UPLOAD REQUIRED.  Travel to loss site beyond 2 hours requires adjuster approval.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"5028-SF", "collect_deductible"=>"No.  The deductible will be applied elsewhere on the claim.", "customer_service_contacts"=>"1-800-485-3004, option 4", "effective_date"=>"2016-11-07", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>118, "name"=>"Gulfstream Property & Casualty Ins. Co.", "pricing"=>"Local pricing for your area.", "property_type"=>"Residential and Commercial", "special_conditions"=>nil, "states_involved"=>"AL, FL, LA, MS, SC, TX"})

  InsuranceCompany.create({"bulletin_number"=>"3794-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"800--486-5616", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>119, "name"=>"Hallmark Insurance Company/Hallmark County Mutual", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. States of:  AZ, AR, CO, GA, ID, IL, IN, KS, KY, MS, MO, MT, NE, NV, NM, OK, OR, SC, TX, UT, WA, WY"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>120, "name"=>"Hanover American Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>121, "name"=>"Hanover Citizens (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>122, "name"=>"Hanover Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>123, "name"=>"Hanover Lloyds (TX) (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>124, "name"=>"Hanover New Jersey Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"2964-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Deborah Daughton, Phone 800-638-3669; Email deborah_daughton@harfordmutual.com", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"ScanER", "id"=>125, "name"=>"Harford Mutual", "pricing"=>"Regional", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. States of:  DE, DC, MD, NC, NJ, PA, TN, VA"})

  InsuranceCompany.create({"bulletin_number"=>"3805-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Assigned Adjuster or Claims at 800-442-8277", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>126, "name"=>"Hastings Mutual", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. States of:   IL, IN, MI, OH, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4141-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Larry Lentine, 860-887-3553 x 4346", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>127, "name"=>"Hingham Mutual (Subsidiary of New London County Mutual)", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook. Take readings daily.  Obtain adjuster approval to monitor on holidays and weekends. Do not use ITEL or any other vendor without approval of New London County Insurance Adjuster. Additional conditions to notify adjuster: 1) if packout will exceed $2,000; 2) prior to any demolition.", "states_involved"=>"U. S. States of CT, ME, MA, NH, RI"})

  InsuranceCompany.create({"bulletin_number"=>"3979-SF-2", "collect_deductible"=>"No. Hochheim Prairie assures the Franchise ill receive the full deductible amount.", "customer_service_contacts"=>"Call the assigned adjuster.  If asbestos is discovered, contact the adjsuter for direction.", "effective_date"=>"2014-08-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>128, "name"=>"Hochheim Prairie", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook", "states_involved"=>"U. S. state of:  TX"})

  InsuranceCompany.create({"bulletin_number"=>"3983-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-Hr. Service Center 800-225-2533", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>129, "name"=>"Holyoke (MiddleOak/Middlesex)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  If loss is identified asn an Antique Home, booties or protective footwear must be worn at all times in customer dwelling.", "states_involved"=>"U. S. States of CT, MA, ME, NY, NH, RI, VT"})

  InsuranceCompany.create({"bulletin_number"=>"5074-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1) Contact assigned adjuster.  2) Mon.-Fri.7:30am-9:30pm, Sat.-Sun.8:00am-6:30pm EST Phone 1-800-252-4626", "effective_date"=>"2016-10-10", "esl"=>0, "estimating_software"=>"Xactimate ", "id"=>130, "name"=>"Home-Owners Insurance (subsid. of Auto-Owners)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Services not included within this agreement, but may be available upon request: structural construction or reconstruction services, asbestos or lead abatement, hazardous cleanup, non-covered losses.", "states_involved"=>"AL, AZ, AR, CO, FL, GA, ID, IL, IN, IA, KS, KY, MI, MN, MO, NE, NC, ND, OH, PA, SC, SD, TN, UT, VA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3325-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Regular business hours: 888-210-5235 x 3688; after hours 866-324-3138", "effective_date"=>"2008-12-03", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>131, "name"=>"Homeowners Choice Property Insurance", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"The insured is responsible for dry cleaning.", "states_involved"=>"U. S. State of:  FL"})

  InsuranceCompany.create({"bulletin_number"=>"3800-SF", "collect_deductible"=>"Yes, if possible.", "customer_service_contacts"=>"866-407-9896;              Local 972-607-4241", "effective_date"=>"2010-08-12", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>132, "name"=>"Homeowners of America", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Call adjuster from scene, if possible, and advise extent of damage.", "states_involved"=>"U. S. States of TX and OK"})

  InsuranceCompany.create({"bulletin_number"=>"4347-F-3", "collect_deductible"=>"Collect the deductible unless otherwise directed by the Homesite Adjuster.", "customer_service_contacts"=>"1-800-HOMESITE (1-800-466-3748)", "effective_date"=>"2015-07-12", "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>133, "name"=>"Homesite Insurance -Water/ Fire/Smoke Mitigation", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Program. WATER: Use Drying Workbook. Where appropriate, dry carpet in place, if it can be saved. Obtain prior approval from Adjuster for any demolition, removing carpet and hardwood floor coverings, content cleaning above $250, if packout will exceed $2,000, Category 2 or 3 water loss, Class 3 or 4 water loss. Measurements should be to the inch.  Apply antimicrobial on appropriate losses per IICRC guidelines; do not apply on Cat 1 losses.   Fire: Contact Adjuster if packout will exceed $2,000; for contents cleaning estimated above $250. No demolition without adjuster approval.  Refer all textile losses to CRDN.", "states_involved"=>"All U. S. States - Special selection criteria for fire jobs includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"3692-SF", "collect_deductible"=>"Yes, with adjuster approval.", "customer_service_contacts"=>"Jim Todd, Sr. Claims Mgr. 515-327-2865 or 1-800-274-3531", "effective_date"=>"2010-08-06", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>134, "name"=>"IMT Group", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook", "states_involved"=>"U. S. States of IA, IL, NE, SD, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-279-7221", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>135, "name"=>"Indiana Insurance", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-800-279-7221", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>136, "name"=>"Indiana Insurance", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>137, "name"=>"Interstate Fire, Interstate Indemnity (Subsidiaries of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4099-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center Phone 800-876-8766; Fax 800-365-2562", "effective_date"=>"2014-11-04", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>138, "name"=>"Iowa American (subsidiary of Motorists Mutual)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster of Category 1 water losses prior to removal of drywall or carpet.  LOCAL JOBS MUST BE UPLOADED.", "states_involved"=>"U. S. States of IA, IL, IN, KY, MA, ME, MI, MN, NE, NH, OH, PA, RI, SC, VT, WI, WV"})

  InsuranceCompany.create({"bulletin_number"=>"4099-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center Phone 800-876-8766; Fax 800-365-2562", "effective_date"=>"2014-11-04", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>139, "name"=>"Iowa Mutual (subsidiary of Motorists Mutual)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster of Category 1 water losses prior to removal of drywall or carpet.  LOCAL JOBS MUST BE UPLOADED.", "states_involved"=>"U. S. States of IA, IL, IN, KY, MA, ME, MI, MN, NE, NH, OH, PA, RI, SC, VT, WI, WV"})

  InsuranceCompany.create({"bulletin_number"=>"3793-F-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center 1-888-252-2799", "effective_date"=>"2014-07-03", "esl"=>3, "estimating_software"=>"Xactimate 27.5", "id"=>140, "name"=>"Kemper", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Supporting photos of damage, drying equipment, high-end contents.  If substantial amount of equipment is required on site, photos depicting equipment in use should be taken when possible.  Utilize Xactimate Sketch Diagramming Tool to draw accurate room dimensions, including actual measurements used as basis for support of calculations of mitigation services. If contact cannot be established with the adjuster for the verbal briefing, enter notes in XactAnalysis using notes function.  Immediate Notification to the Adjuster in the following instances:  Surface or subsurface ground water, evidence of repeated seepage, if suspected that homeowner did not maintain adequate heat, unknown origin of water, if packout will exceed $1,000, plumbing leakage appearing to have occurred over more than a 24-hour period, all Category 3 water losses, any Class 3 or Class 4 water loss, contents cleaning estimated above $1,000, lead testing, if cost of mitigation services differs $500 or more from original scope communicated to adjuser in initial assessment.  If mold is discovered, no emergency mitigation or mold remediation will be performed until Kemper has reviewed the loss.  The following is not allowed without prior approval from Kemper: construction repair/replacement work, asbestos/lead contamination product abatement, content packout and/or content cleaning.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4075-F-2", "collect_deductible"=>"Do not collect deductible unless a specific request is made by  a LM Mitigation Specialist to do so.", "customer_service_contacts"=>"Liberty Mutual Mitigation Specialist:  1-855-212-3227", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 28 ", "id"=>141, "name"=>"Liberty Mutual", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Franchise must have voice-to-voice contact with a LM Mit. Spec. while on site during initial inspection. If not available, email information to LM-supplied location through a note in the electronic file. Provide Vendor name, contact #, IICRC #, Arrival time, cause, category and class of loss, mold, lead, asbestos exposure, structure and content damages, if packout required, required demolition, extraction method, drying plan, equipment types to be used, any customer discussions.  Use DRYBOOK.", "states_involved"=>"All U. S. Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless directed by adjuster.", "customer_service_contacts"=>"1-800-289-0930", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>142, "name"=>"Liberty Mutual Water Mitigation Program (Formerly Known as LMAC)", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-289-0930", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>143, "name"=>"Liberty Northwest", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-3", "collect_deductible"=>"No, unless directed by adjuster.", "customer_service_contacts"=>"1-800-289-0930", "effective_date"=>"2015-05-01", "esl"=>2, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>144, "name"=>"Liberty Mutual Commercial Water", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless directed by adjuster.", "customer_service_contacts"=>"1-800-289-0930", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>145, "name"=>"Liberty Northwest", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4102-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>146, "name"=>"Litchfield Mutual Fire (affiliate of State Auto)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3211-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Scott Lutz or Robin Halter 1-800-626-4751", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"ScanER", "id"=>147, "name"=>"Lititz Mutual Insurance Company", "pricing"=>"Local pricing for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. States of DE, KS, MD, MO, NC, PA, SC, VA, WV"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>148, "name"=>"Lloyds Syndicate 1084 (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3545-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"April Bridgeman, VP of Claims, Phone 540-882-3232 x 127", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>149, "name"=>"Loudoun Mutual Insurance Company", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. State of VA"})

  InsuranceCompany.create({"bulletin_number"=>"3029-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Handling Adjuster or On-Call MMG Adjuster. After Hours 1-800-343-0533", "effective_date"=>"2005-09-11", "esl"=>2, "estimating_software"=>"ScanER", "id"=>150, "name"=>"Maine Mutual Group", "pricing"=>"Local pricing for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. States of ME, NH, VT"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>151, "name"=>"Maryland Casualty (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>152, "name"=>"Massachusetts Bay Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3382-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Western Region (Western WA, OR, CA, CO, and WY) Local: 206-448-4911 Toll-Free: 800-247-2643.   Eastern Region (Eastern WA and ID) Local 509-924-7039,  Toll Free 800-824-2702.  Claims 800-826-3397\n", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"ScanER", "id"=>153, "name"=>"Mayflower Corporation (affiliate of Grange Ins. Group)", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in CA, CO, ID, OR, WA, and WY."})

  InsuranceCompany.create({"bulletin_number"=>"4493-SF", "collect_deductible"=>"No, unless otherwise instructed by the Adjuster.", "customer_service_contacts"=>"1-800-974-1222 (Joanne Marinaro, Claims Manager; 704-569-7881 (Danielle Murphy)", "effective_date"=>nil, "esl"=>nil, "estimating_software"=>"Xactimate", "id"=>154, "name"=>"Members Insurance Company (AAA of Carolina Group)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Verbal briefing to AAA Carolina rep or adjuster same business day, or at maximum, 24 hours of referral of claim, to include overview of job, any unusual circumstancesthat would allow AAA of Carolina to assess scope or severity of water and estimated total damages. If unable to meet guidelines, notify SERVPRO Call Center. Desiccant Dehus, Air Scrubbers, Injectidry Systems or other floor-drying systems require prior adjuster approval. Notify/get adjuster approval for: source not known or not from plumbing system insdide the home, customer service issure, pre-existing damage. If Category 1 loss changes to Category 2 or 3; if affected flooring continues through other unaffected rooms, supplements to the water-mitigation job.  Sketch/Dimennsioning: measure to the inch.", "states_involved"=>"U. S. Franchises in NC, SC"})

  InsuranceCompany.create({"bulletin_number"=>"3199-F-2", "collect_deductible"=>"Yes - on mitigation jobs only.", "customer_service_contacts"=>"Calif. - 909-919-7050 x21907; FL & GA -800-987-6000 x63225; AZ,IIL ,NV, OK & TX - 512-241-4162 x44162; PA, NY, NJ, VA - 800-987-2032 x60039", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 27.5", "id"=>155, "name"=>"Mercury Insurance Company                                                            Mercury Casualty Company                                          Mercury Indemnity Company of America                                     Mercury Insurance Company of Illinois                                           Mercury Insurance Company of Georgia", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct. - UTILIZE DRYBOOK. Do not solicit or refer any resoration work beyond mitigation.  Only if the insured initiates such discussion, should Franchisee discuss their capabilities beyond mitigation services.  PHOTOS: In addition to standard, include pre- and post-mitigation for all affected rooms with overview of eqipment and contents; post-mitigation photos after equipment removal. Lift and dry carpet if it can be saved. Reinstall saved carpet. If carpet cannot be saved, lift and remove carpet and leave 12\" square sample of carpet and pad at insured's for adjuster. Contact adjuster if: contents cleaning or packout is probable (must obtain adjuster approval and put on separate estimate), plumbing leakage appearing to have occurred over 24-hours, policyholder request bid for other than emergency water mitigation.  If restoration and/or reconstruction is appvd. by adjuster and insured, complete Xactimate estimate separate from mitigation. Documented appvl from adjuster must be received prior to commencing any restoration services. All contact with insureds must be time stamped and reported in SERVPRO's management reporting system.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4102-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>156, "name"=>"Meridian Security and Meridian Citizens Mutual (affiliates of State Auto)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4261-F", "collect_deductible"=>"Collect deductible when mitigation services are completed unless directed otherwise by the assigned adjuster.", "customer_service_contacts"=>"1-800-854-6011, select \"0\" for live voice.  After hours 1-800-854-6011 x 55400", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Xactimate 27.5", "id"=>157, "name"=>"MetLife - Fire/Smoke Program", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  FOR LOCAL LOSSES, SEE BULLETIN. Use SERVPRO forms. Take pictures of cause and origin of fire, if possible; add'l photos required of any specialty drying equipment and after any demo.  Use Drying Workbook. Report subrogation to adjuster, then to MetLife's Subrogation Unit at 800-854-6011 x 6270.", "states_involved"=>"All U. S. States - Special selection criteria includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"4173-F", "collect_deductible"=>"No", "customer_service_contacts"=>"1-800-854-6011, select \"0\" for live voice.  After hours 1-800-854-6011 x 55401", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate 27.5", "id"=>158, "name"=>"MetLife - Water Program", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  FOR LOCAL LOSSES, SEE BULLETIN. Use SERVPRO forms. Photos required of any specialty drying equipment and after any demo.  Use Drying Workbook. Report subrogation to adjuster, then to MetLife's Subrogation Unit at 800-854-6011 x 6270.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4000-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Adjuster assigned to the loss.                                                           Sr. Prop. Claim Spec. Tom  Clark, 517-323-7000", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>159, "name"=>"Michigan Farm Bureau", "pricing"=>"Use most current price list for the area based on zip code for loss location. Price list being used should be identified on the estimate. Base Service Charges not allowed.", "property_type"=>"R & C", "special_conditions"=>"Photos  of property involved in the loss (broken pipe, leaking water line, etc.) should be obtained if mitigation efforts make it necessary to disturb this property. Do not discard any personal property items of insured without consent of insured AND assigned Michigan Farm Bureau Adjuster.", "states_involved"=>"U. S. Franchises in MI"})

  InsuranceCompany.create({"bulletin_number"=>"3983-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-Hr. Service Center 800-225-2533", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>160, "name"=>"MiddleOak/ Middlesex/ Holyoke", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  If loss is identified as an Antique Home, booties or protective footwear must be worn at all times in customer dwelling.", "states_involved"=>"U. S. States of CT, MA, ME, NY, NH, RI, VT"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>161, "name"=>"Midway Insurance Co. of IL (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4102-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>162, "name"=>"Millbank Insurance (affiliate of State Auto)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4203-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Contact the Adjuster.  If not available, call 1-866-275-7322 (Claim Ctr.)", "effective_date"=>"2012-05-11", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>163, "name"=>"Mississippi Farm Bureau", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.", "states_involved"=>"U. S. State of Mississippi"})

  InsuranceCompany.create({"bulletin_number"=>"3808-SF", "collect_deductible"=>"No; however, discuss with adjuster if loss appears to be mitigation only.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Charles Strube, Claims Supervisor, Phone 503-723-6311\n3) 1-866-COUNTRY (1-866-268-6879).", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>164, "name"=>"Modern Service Insurance (subsidiary of COUNTRY Mutual)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook on Residential, Monitoring/Inspectiion Report on Commercial. Packout, Contents Cleaning, or Demolition requires prior adjuster approval. If after hours, only demo which is immediately necessary as part of initial drying plan shoud be performed.", "states_involved"=>"U.S. Franchises in OR and Southwest WA"})

  InsuranceCompany.create({"bulletin_number"=>"3370-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Kara Tierney Phone 866-270-8430 x 156", "effective_date"=>"2008-01-07", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>165, "name"=>"Modern USA Ins. Co.", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. State of Florida"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-561-0178", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>166, "name"=>"Montgomery Insurance", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-800-561-0178", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>167, "name"=>"Montgomery Insurance", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4099-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center Phone 800-876-8766; Fax 800-365-2562", "effective_date"=>"2014-11-04", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>168, "name"=>"Motorists Commercial Mutual (MCM) - subsidiary of Motorists Mutual", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster of Category 1 water losses prior to removal of drywall or carpet.  LOCAL JOBS MUST BE UPLOADED.", "states_involved"=>"U. S. States of IA, IL, IN, KY, MA, ME, MI, MN, NE, NH, OH, PA, RI, SC, VT, WI, WV"})

  InsuranceCompany.create({"bulletin_number"=>"4099-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center Phone 800-876-8766; Fax 800-365-2562", "effective_date"=>"2014-11-04", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>169, "name"=>"Motorists Mutual Insurance", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster of Category 1 water losses prior to removal of drywall or carpet.  LOCAL JOBS MUST BE UPLOADED.", "states_involved"=>"U. S. States of IA, IL, IN, KY, MA, ME, MI, MN, NE, NH, OH, PA, RI, SC, VT, WI, WV"})

  InsuranceCompany.create({"bulletin_number"=>"4143-SF", "collect_deductible"=>"Check with Adjuster", "customer_service_contacts"=>"Phone 401-495-6059 or 800-343-3376", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate", "id"=>170, "name"=>"Narragansett Bay Fire/Smoke Mitigation Program", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"SEE BULLETIN FOR CRITERIA FOR PERFORMING FIRE/SMOKE LOSSES. Upon receipt of job, Franchise must notify Narragansett Bay Insurance of the Franchise Name and Phone Number that is assigned to the loss.  If possible, take pictures of cause and origin of fire.", "states_involved"=>"U. S. States of MA, NJ, NY, RI - Special selection criteria includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"4142-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Phone 401-495-6059 or 800-343-3375", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate", "id"=>171, "name"=>"Narragansett Bay Water Mitigation Program", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Use Drying Workbook and take readings daily.  Weekend and holiday monitoring must have adjuster approval.", "states_involved"=>"U. S. States of MA, NJ, NY, RI"})

  InsuranceCompany.create({"bulletin_number"=>"4627-F", "collect_deductible"=>"If directions for deductible is not provided on FNOL, contact the Nationwide/ Allied Claims Handler.", "customer_service_contacts"=>"Assigned Adjuster.  If not available, call 1-800-421-3535.", "effective_date"=>"2014-10-11", "esl"=>5, "estimating_software"=>"Xactimate Version 28", "id"=>172, "name"=>"Nationwide Insurance Company/Allied Insurance Company/Nationwide Agribusiness - Commercial Water Mitigation Program", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Use Nationwide Forms: ATP and Satisfaction of Repair. Notify adjuster of losses that may exceed $7,500, damage that appears to be exceptional or attributed to deterioration or wear and tear, suspicious activities, facts, or findings. Obtain sample if more th an 144 sq. ft. of flooring is damaged beyond repair. Requires Initial Upload.  See bulletin for additional information.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3557-F-2", "collect_deductible"=>"If directions for deductible is not provided on FNOL, contact the Nationwide/ Allied Claims Handler.", "customer_service_contacts"=>"Assigned Adjuster.  If not available, call 1-800-421-3535.", "effective_date"=>"2014-10-11", "esl"=>1, "estimating_software"=>"Xactimate Version 28", "id"=>173, "name"=>"Nationwide Insurance Company/Allied Insurance Company - Residential Water Mitigation Program", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Use Nationwide Forms: ATP and Satisfaction of Repair. Immediately report any pre-existing damage to Claims Handler. If more than 144 sq. ft. of flooring is unrepairable, obtain sample and notify Claims Handler. Do not dispose of any items that Claims Handler has deemed salvageable. Assist with moving and storage of salvageable items from loss location to an off-site location.  Initial Upload required.  See bulletin for additional information.", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>174, "name"=>"New England Ins. Co. and New England Reinsurance Corp. - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4141-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Larry Lentine, 860-887-3553 x 4346", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>175, "name"=>"New London County Mutual", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook. Take readings daily.  Obtain adjuster approval to monitor on holidays and weekends. Do not use ITEL or any other vendor without approval of New London County Insurance Adjuster. Additional conditions to notify adjuster: 1) if packout will exceed $2,000; 2) prior to any demolition.", "states_involved"=>"U. S. States of CT, ME, MA, NH, RI"})

  InsuranceCompany.create({"bulletin_number"=>"3393-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Contact the local adjuster, If unknown, call NC Farm Bureau 919-782-1705.", "effective_date"=>"2008-12-09", "esl"=>2, "estimating_software"=>"ScanER", "id"=>176, "name"=>"North Carolina Farm Bureau", "pricing"=>"Use local pricing for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in NC"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>177, "name"=>"Northern Insurance Co. of New York (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>178, "name"=>"Nova Casualty (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>179, "name"=>"Nutmeg Insurance Co. - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-866-255-5530", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>180, "name"=>"Ohio Casualty", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-866-255-5530", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>181, "name"=>"Ohio Casualty", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4064-SF", "collect_deductible"=>"Contact the Adjuster whether to collect the deductible.", "customer_service_contacts"=>"Westfield Insurance Customer Care Center: Phone 866-937-2663, Corry Novosel: Phone 724-776-7200", "effective_date"=>"2012-03-04", "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>182, "name"=>"Ohio Farmers (affiliate of Westfield Insurance Company)", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use price list attached to bulletin.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Contact adjuster immediately and obtain direction on how to proceed if content cleaning or packout is involved (not included in this program). Water mitigation performed solely in conjunction with fire/smoke job should be included in fire/smoke estimate.  Use DRYING WORKBOOK.", "states_involved"=>"U. S. Franchises in AZ, CO, DE, FL, GA, IL, IN, IA, KY, MD, MI, MN, NM, NC, OH, PA, SC, TN, VA, WV, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4488-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"1-800-686-3011, Option 6", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>183, "name"=>"Ohio Mutual", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"CT, IN, ME, NH, OH, RI, VT"})

  InsuranceCompany.create({"bulletin_number"=>"4064-SF", "collect_deductible"=>"Contact the Adjuster whether to collect the deductible.", "customer_service_contacts"=>"Westfield Insurance Customer Care Center: Phone 866-937-2663, Corry Novosel: Phone 724-776-7200", "effective_date"=>"2012-03-04", "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>184, "name"=>"Old Guard Insurance (Affiliate of Westfield Insurance Company)", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use price list attached to bulletin.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Contact adjuster immediately and obtain direction on how to proceed if content cleaning or packout is involved (not included in this program). Water mitigation performed solely in conjunction with fire/smoke job should be included in fire/smoke estimate.  Use DRYING WORKBOOK.", "states_involved"=>"U. S. Franchises in AZ, CO, DE, FL, GA, IL, IN, IA, KY, MD, MI, MN, NM, NC, OH, PA, SC, TN, VA, WV, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3390-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claire Mullaney,Property Supervisor, 781-332-8640", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"ScanER ", "id"=>185, "name"=>"OneBeacon Insurance Group", "pricing"=>"Utilize local pricing in your area", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"5074-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1) Contact assigned adjuster.  2) Mon.-Fri.7:30am-9:30pm, Sat.-Sun.8:00am-6:30pm EST Phone 1-800-252-4626", "effective_date"=>"2016-10-10", "esl"=>0, "estimating_software"=>"Xactimate ", "id"=>186, "name"=>"Owners Insurance (subsid. of Auto-Owners)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Services not included within this agreement, but may be available upon request: structural construction or reconstruction services, asbestos or lead abatement, hazardous cleanup, non-covered losses.", "states_involved"=>"AL, AZ, AR, CO, FL, GA, ID, IL, IN, IA, KS, KY, MI, MN, MO, NE, NC, ND, OH, PA, SC, SD, TN, UT, VA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>187, "name"=>"Pacific Insurance Company - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3970-F", "collect_deductible"=>"Collect deductible on mitigation-only jobs. Jobs that require more than mitigation, GeoVera will apply the deductible elsewhere on the claim.", "customer_service_contacts"=>"Holly Wolf, Prop. Claims Mgr. for AL, GA, NC, SC, FL, VA;  850-219-5801; after hours 800-785-3085;                                  Pat Power, Claims Mgr. for CA, WA, OR, TX, OK, AR, KS, MO, AZ; 707-863-3748; after hours 800-785-3230\n\n", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate; a separate Xactimate estimate is required for approved mold remediaton services.", "id"=>188, "name"=>"Pacific Select Insurance (affiliated with GeoVera)", "pricing"=>"Use the most current price list provided by XactimateÒ for your area", "property_type"=>"R", "special_conditions"=>"Contact Adjuster immediately if insured refuses service; attempt to take photos of building and loss. Call after hours when safety or health issue or if cause of loss is differet than initially reported. Contact adjuster if potential salvage exists, packout, contents cleaning, demolition. Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3646-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claim Support Staff at 1-800-962-1172.  After hours and weekends call 650-642-7233.", "effective_date"=>"2010-02-04", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>189, "name"=>"Pacific Specialty Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate", "property_type"=>"R", "special_conditions"=>"Itemized inventory of all contents for packout and cleaning affected by loss is required. Take photos of all salvagable and nonsalvagable contents in the affected area. Only drill behind the baseboards.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>190, "name"=>"Palomar Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"3631-F", "collect_deductible"=>"On mitigation only jobs, collect the deductible.", "customer_service_contacts"=>"Contact the Handling Adjuster or Chip Mateviere-cmateviere@fmis.com", "effective_date"=>"2010-03-03", "esl"=>2, "estimating_software"=>"ScanER", "id"=>191, "name"=>"Patriot Insurance Company", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in ME, NH,  VT"})

  InsuranceCompany.create({"bulletin_number"=>"#4144-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Paul Metevier, Phone 207-847-1800, paul.metevier@fmins.com, After Hours: 1-866-460-1776", "effective_date"=>nil, "esl"=>10, "estimating_software"=>"Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>192, "name"=>"Patriot Insurance Company ", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"C ", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in ME, NH, VT (Participation is contingent upon approval by Patriot Insurance and SERVPRO's Commercial Large Loss Division.)"})

  InsuranceCompany.create({"bulletin_number"=>"4102-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>193, "name"=>"Patrons Mutual Ins. Co. of CT (affiliate of State Auto)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>194, "name"=>"Peak Property & Casualty (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-522-7152", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>195, "name"=>"Peerless Insurance", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F-2", "collect_deductible"=>"No, unless instructed by adjuster.", "customer_service_contacts"=>"1-800-522-7152", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>196, "name"=>"Peerless Insurance", "pricing"=>"Current price list", "property_type"=>"C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U. S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3167-SF", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"Steve Annis - (800)492-1205", "effective_date"=>"2006-01-12", "esl"=>2, "estimating_software"=>"ScanER", "id"=>197, "name"=>"Peninsula Insurance Company", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in DE, MD, NH, PA, SC, TN,\nVA, and WV"})

  InsuranceCompany.create({"bulletin_number"=>"4309-SF-2", "collect_deductible"=>"No, unless otherwise instructed by the Adjuster.", "customer_service_contacts"=>"First point of contact will be listed on the FNOL, if not, call 1-800-766-2245.", "effective_date"=>"2015-09-02", "esl"=>0, "estimating_software"=>"Xactimate", "id"=>198, "name"=>"Penn National", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"While on site, report initial scope to the Claims Handler; if not available, contact the Claims Supervisor.  Additional notifications to the adjuster: If contents cleaning or packout is probably, if pre-existing damage; if demoliton.", "states_involved"=>"U.S. Franchises in AL, DE, MD, NC, NJ, PA, SC, TN, VA"})

  InsuranceCompany.create({"bulletin_number"=>"4645-F-2", "collect_deductible"=>"No.  The deductible will be applied elsewhere on the claim.", "customer_service_contacts"=>"Ivy Kitzinger, phone 800-247-5930", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>199, "name"=>"Pharmacists Mutual", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Local jobs must be uploaded utilizing DryBook.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4099-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center Phone 800-876-8766; Fax 800-365-2562", "effective_date"=>"2014-11-04", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>200, "name"=>"Phenix Mutual (subsidiary of Motorists Mutual)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster of Category 1 water losses prior to removal of drywall or carpet.  LOCAL JOBS MUST BE UPLOADED.", "states_involved"=>"U. S. States of IA, IL, IN, KY, MA, ME, MI, MN, NE, NH, OH, PA, RI, SC, VT, WI, WV"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>201, "name"=>"Pillar Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4489-SF-2", "collect_deductible"=>"Water Mit. - Collect Deductible;  Fire/Smoke Deductible - Check with adjuster.", "customer_service_contacts"=>"810-733-2300", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>202, "name"=>"Pioneer State Mutual - Water/Fire/Smoke Mitigation Program", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SEE BULLETIN FOR CRITERIA FOR PERFORMING FIRE/SMOKE LOSSES. Upon receipt of job, Franchise must notify Pioneer State Mutual of the Franchise Name and Phone Number that is assigned to the loss.", "states_involved"=>"Michigan"})

  InsuranceCompany.create({"bulletin_number"=>"4146-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Claims Phone: 800-333-7642", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work. Adjuster must be notified that the job will exceed $100,000.", "id"=>203, "name"=>"Preferred Mutual - Water Mitigation", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"R & C", "special_conditions"=>"Drying Workbook required. Notify adjuster if packout will exceed $2,000 and prior to any demolition. Obtain adjuster approval for monitoring on weekends, holidays, and after hours. Do not use ITEL or any other vendor without adjuster approval. ", "states_involved"=>"U.S. Franchises in MA, NH, NJ, NY"})

  InsuranceCompany.create({"bulletin_number"=>"4145-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Claims Phone: 800-333-7642", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate", "id"=>204, "name"=>"Preferred Mutual Insurance Company - Fire and Smoke", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Take pictures of cause and origin of fire, if possible. Adjuster approval needed for demolition, dumpsters, pods. Take photos of brica-brac itmes before removing from original location and make inventory list that identifies box number and contents of each box.", "states_involved"=>"U.S. Franchises in MA, NH, NJ, NY - Special selection criteria includes a minimum monthly average of $10,000 in fire and smoke work performed for a rolling 12-month period."})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>205, "name"=>"Professionals Direct Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>206, "name"=>"Property and Casualty Ins. Co. of Hartford - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"5074-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1) Contact assigned adjuster.  2) Mon.-Fri.7:30am-9:30pm, Sat.-Sun.8:00am-6:30pm EST Phone 1-800-252-4626", "effective_date"=>"2016-10-10", "esl"=>0, "estimating_software"=>"Xactimate ", "id"=>207, "name"=>"Property-Owners Insurance (subsid. of Auto-Owners)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Services not included within this agreement, but may be available upon request: structural construction or reconstruction services, asbestos or lead abatement, hazardous cleanup, non-covered losses.", "states_involved"=>"AL, AZ, AR, CO, FL, GA, ID, IL, IN, IA, KS, KY, MI, MN, MO, NE, NC, ND, OH, PA, SC, SD, TN, UT, VA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4369-F", "collect_deductible"=>"Do not collect deductible unless otherwise instructed in writing by adjuster.", "customer_service_contacts"=>"Claims: 1-888-813-PURE;  Frank Digrande, VP Prop. Claims, 914-328-8101, fdigrande@purehnw.com", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"At initial inspection, excluding subcontract work, the loss is considered to be:  $100,000 or less, use Xactimate;  over $100,000, use Time and Materials.", "id"=>208, "name"=>"PURE High Net Worth Insurance (Revision)/PURE Risk Managament, LLC", "pricing"=>"Use the most current price list provided by Xactimate or Time and Materials for your area.", "property_type"=>"R", "special_conditions"=>"SNAPA Account.  No emergency svcs to be performed until a signed Auth. To Perform Svcs. Is secured.  Both local and Call Center jobs must be uploaded. Use Drying Workbook. Use in-place drying when appropriate.  If carpet cannot be saved, contact adjuster whether to send to ITEL. Apply antimicrobial when appropriate. Adjuser approval required prior to content cleanign or pack-out. Since Asbestos Abatement and Mold Remediation are not included in this program, contact the adjuster on how to proceed.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4566-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims: 800-747-7642", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>209, "name"=>"Rockford Mutual Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Reconstruction services may be provided by the Franchise performing the mitigation if requested by the adjuster or the homeowner.  If the Franchise performing the mitigation work does not choose to perform reconstruction, the Franchise may refer the reconstruction to another SERVPRO Franchise or contact the Trainer for direction.", "states_involved"=>"U.S. States of IL, IN, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4227-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Contact local adjuster\nor Claims Assistance\nTelephone: 540-434-5904 Toll free: 800-662-5246", "effective_date"=>"2012-12-12", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>210, "name"=>"Rockingham Insurance, Rockingham Mutual, Rockingham Casualty, Rockingham Mutual Service Agency, Inc.", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in PA and VA"})

  InsuranceCompany.create({"bulletin_number"=>"3382-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Western Region (Western WA, OR, CA, CO, and WY) Local: 206-448-4911 Toll-Free: 800-247-2643.   Eastern Region (Eastern WA and ID) Local 509-924-7039,  Toll Free 800-824-2702.  Claims 800-826-3397\n", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"ScanER", "id"=>211, "name"=>"Rocky Mountain Fire & Casualty (affiliated with Grange Ins. Group)", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in CA, CO, ID, OR, WA, and WY."})

  InsuranceCompany.create({"bulletin_number"=>"4043-F-3", "collect_deductible"=>"No, unless otherwise directed to do so by a Safeco Mitigation Specialist.", "customer_service_contacts"=>"Water Mitigation Unit:                         1-888-873-5475                            Customer Service: 1-800-332-3226", "effective_date"=>nil, "esl"=>nil, "estimating_software"=>"Xactimate 27.3", "id"=>212, "name"=>"Safeco Residential Water and Fire/Smoke Mitigation", "pricing"=>"27.3", "property_type"=>"Residential", "special_conditions"=>"SNAPA Acct.  Franchise must have voice-to-voice contact with a Safeco Mit. Spec. while on site during initial inspection. If not available, email information to supplied location through a note in the electronic file. Provide Vendor name, contact #, IICRC #, Arrival time, cause, category and class of loss, mold, lead, asbestos exposure, structure and content damages, if packout required, required demolition, extraction method, drying plan, equipment types to be used, any customer discussions.  Use DRYBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4043-F-5", "collect_deductible"=>"No, unless otherwise directed to do so by a Safeco Mitigation Specialist.", "customer_service_contacts"=>"Water Mitigation Unit:                         1-888-873-5475                            Fire/Smoke Customer Service:       1-800-332-3226", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate 28", "id"=>213, "name"=>"Safeco Residential Water and Fire/Smoke Mitigation", "pricing"=>"Franchises must use the price list downloaded with the assignment and apply a 2.5% discount to water, mold and sewage Xactimate pricing for entire claim.  See ServproNET for instructions on how to apply discount.", "property_type"=>"Residential", "special_conditions"=>"SNAPA Acct.  Franchise must have voice-to-voice contact with a Safeco Mit. Spec. while on site during initial inspection. If not available, email information to supplied location through a note in the electronic file. Provide Vendor name, contact #, IICRC #, Arrival time, cause, category and class of loss, mold, lead, asbestos exposure, structure and content damages, if packout required, required demolition, extraction method, drying plan, equipment types to be used, any customer discussions.  Use DRYBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3747-F", "collect_deductible"=>"Yes, unless otherwise instructed by the assigned adjuster/examiner. If problems w/collecting deductible, call the Safety Representative for assistance.", "customer_service_contacts"=>"Normal Business Hours: 617-951-0600\nAfter-Hours and Weekends: 866-981-5289", "effective_date"=>nil, "esl"=>nil, "estimating_software"=>nil, "id"=>214, "name"=>"Safety Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.;  Communicate with adjuster for: type and degree of damage, extent of manipulation of contents, amount and type of equipment estimated, any add'l services needed, any special equipment. Apply antimicrobial where appropriate (IICRC). In-place drying for carpet and pad are preferred for clean water. Square footage deduction for all window/door openings. Do not recommend any dry cleaner or contractor to insured. Stress to policyholder the importance of saving the part if possible subrogation. Emergency pre-cleaning for Fire mitigation is limited to cleaning nad coating at-risk surfaces and water extraction.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>215, "name"=>"San Francisco Reinsurance (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3744-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Mike Krabbe, Sr. Claims Representative, 1-800-558-3405. ext/ 4682", "effective_date"=>"2010-12-08", "esl"=>2, "estimating_software"=>"ScanER", "id"=>216, "name"=>"SECURA", "pricing"=>"Utilize local pricing for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in AZ, CO, IA, IL, IN, KS, KY, MI, MN, MO, ND, PA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3200-SF", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"Call Center: 1-800-758-0101", "effective_date"=>"2007-02-03", "esl"=>2, "estimating_software"=>"Xactimate\nScanERXL", "id"=>217, "name"=>"Seguros Multiples", "pricing"=>"Utilize local Xactimate pricing for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in FL"})

  InsuranceCompany.create({"bulletin_number"=>"3702-SF", "collect_deductible"=>"Yes, if mitigation only.", "customer_service_contacts"=>"Claims Department\nPhone 866-455-9969", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>218, "name"=>"Selective Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate for your area. Base Service Charges should NOT be applied", "property_type"=>"R & C", "special_conditions"=>"If job is referred by a public adjuster, the Franchisee must notify the Selective Ins. adjuster within 2 business hours. Before beginning, Franchise must call the adjuster with job overview, determine coverage, and get authorization. Adjuster approval needed for use of large desiccant dehus, use of portable temporary power, use of dessiccants.  Use DRYING WORKBOOK for Residential; use Monitoring Report for Commercial. Follow IICRC on antimicrobial. Notify adjuster of contents cleaning, packout,textile cleaning. Franchise must be able to do board-up work if necessary.", "states_involved"=>"U.S. Franchises in CT, DC, DE, GA, IA, IL, IN, KY, MA,\nMD, MN, MO, NC, NJ, NY, OH, PA, RI,\nSC, TN, VA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>219, "name"=>"Sentinel Ins. Co. Ltd. - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4101-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Sentry Insurance 800-373-6879                                                       John Todd Claims Senior Technical Specialist, 715-346-9370", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Xactimate", "id"=>220, "name"=>"Sentry Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>221, "name"=>"Service Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4157-F", "collect_deductible"=>"Not applicable", "customer_service_contacts"=>"Communicate/coordinate with SDA Church contact person on site at each church-owned location, as well as the assigned adjuster. Any services or monitoring during their period of worship must be coordinated with the church contact person on how to proceed.                Kevin M. Davidson, Senior Claims Examiner, Phone: 301-680-6882, Email: kdavidson@adventistrisk.org", "effective_date"=>"2012-05-09", "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>222, "name"=>"Seventh-day Adventist (SDA) Church", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"C ", "special_conditions"=>"1) No smoking or alcoholic beverages within 1,000 feet of the SDA Church entity building.  2) On-site staff will direct how SERVPRO Franchises should conduct themselves due to the sensitive tradition of the Church. 3) Notify the Church contact person immediately of the schedule on which work is to be performed (church meeting times must be treated with the utmost respect: sundown Friday until Sundown Saturday) Follow IICRC guidelines. Seek prior approval from the Church contact person for on-site storage containers. Move-outs must be approved by the Church contact person or assigned adjuster.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3861-SF", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"Bo Helms or Blaine Adams, Phone: 601-978-6040", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>223, "name"=>"Shelter Insurance Company - Mississippi", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Use antimicrobial on all wet surfaces", "states_involved"=>"U.S. Franchises in MS"})

  InsuranceCompany.create({"bulletin_number"=>"3896-SF", "collect_deductible"=>"Yes unless otherwise instructed by the adjuster", "customer_service_contacts"=>"The Assigned Adjuster or if there is no assigned adjuster, call the Claims Office at 1-800-342-5791.", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>224, "name"=>"Shelter Insurance Company - Tennessee", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in TN"})

  InsuranceCompany.create({"bulletin_number"=>"4063-SF", "collect_deductible"=>"On losses that will require only mitigation, collect the deductible. ", "customer_service_contacts"=>"1-800-SHELTER (1-800-743-5837)", "effective_date"=>"2012-03-04", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>225, "name"=>"Shelter Insurance Company - Kentucky and Indiana", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in KY and IN"})

  InsuranceCompany.create({"bulletin_number"=>"3853-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Glenn Hayes - Property & Training Manager, Phone 803-936-4519\nCustomer Service Call Center, Phone 1-800-799-7500", "effective_date"=>"2011-07-03", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>226, "name"=>"South Carolina Farm Bureau", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in SC"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>227, "name"=>"Southern Fund (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3498-SF", "collect_deductible"=>"Yes. In cases where deductible cannot be collected, it will be applied elsewhere on the claim.", "customer_service_contacts"=>"Bryan O’Quinn-800-476-5566,   David Hamrick-800-476-5566,   Marla Harris-800-476-5566", "effective_date"=>"2009-11-05", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>228, "name"=>"Southern Trust Insurance Company", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in GA & TN"})

  InsuranceCompany.create({"bulletin_number"=>"5074-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1) Contact assigned adjuster.  2) Mon.-Fri.7:30am-9:30pm, Sat.-Sun.8:00am-6:30pm EST Phone 1-800-252-4626", "effective_date"=>"2016-10-10", "esl"=>0, "estimating_software"=>"Xactimate ", "id"=>229, "name"=>"Southern-Owners Insurance (subsid. of Auto-Owners)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Services not included within this agreement, but may be available upon request: structural construction or reconstruction services, asbestos or lead abatement, hazardous cleanup, non-covered losses.", "states_involved"=>"AL, AZ, AR, CO, FL, GA, ID, IL, IN, IA, KS, KY, MI, MN, MO, NE, NC, ND, OH, PA, SC, SD, TN, UT, VA, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>230, "name"=>"Specialty Risk Services - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3337F", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims 1-800-652-1262;  Renee’ Collins - Claims Manager Choice Product 770-763-1385 or 800-326-2845 x 11385\n(770)763-1385", "effective_date"=>"2008-03-04", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>231, "name"=>"Standard Guaranty Insurance (subsidiary of Assurant Specialty Property)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"If refusal of service, contact adjuster immediately and communicate scope of repairs; attempt to take photos of building and loss.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>232, "name"=>"StarStone National Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4410-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"24-hour contact center phone: 800-766-1853", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>233, "name"=>"State Auto Insurance (includes State Automobile Mutual, State Auto P & C, State Auto Ohio, State Auto Wisconsin, State Auto Florida, Farmers Casualty, Meridian, Beacon Lloyds, Beacon National, Patrons Mutual Ins. Co. of CT, Milbank, Litchfield Mutual Fire)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"BOTH LOCAL AND CALL CENTER JOBS MUST BE UPLOADED FOR AUDIT TO SERVPRO CORPORATE THROUGH SCANER.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3467-F-3", "collect_deductible"=>"Yes, unless otherwise instructed", "customer_service_contacts"=>"Refer to XactAnalysis Assignment                                                  State Farm’s general claim number: 844-458-4300\nFax number:   (844) 236-3646\nEmail:              statefarmfireclaims@statefarm.com", "effective_date"=>"2016-10-10", "esl"=>0, "estimating_software"=>"Xactimate", "id"=>234, "name"=>"State Farm", "pricing"=>"State Farm price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  refer to bulletin; handle all jobs as if they were PSP jobs. (Bulletin #4714-F)    Customer Service Conditions also should be listed on FNOL; notifications and approvals required; see bulletin for complete details.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>235, "name"=>"State National Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>236, "name"=>"Steadfast Ins. Co. ( Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>237, "name"=>"Sussex Insurance Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4932-SF", "collect_deductible"=>"No, the deductible will be applied elsewhere on the claim.", "customer_service_contacts"=>"Contact the local regional claim center.  Hours:  M-F 7:00am-6:00pm;  Sat. 8:00am-4:00pm", "effective_date"=>"2016-07-03", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>238, "name"=>"Tennessee Farm Bureau", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in TN"})

  InsuranceCompany.create({"bulletin_number"=>"4100-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-266-5458; Claims Operations Supervisor Richard Child, Phone 254-751-2315", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>239, "name"=>"Texas Farm Bureau", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"Category 1 water losses, use top-down drying methodology when appropriate under IICRC guidelines. Block furniture and use top-down drying methods when appropriate . Do not remove carpet or wood flooring without prior adjuster approval.", "states_involved"=>"U. S. Franchises in TX"})

  InsuranceCompany.create({"bulletin_number"=>"3967-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"1-800-392-2202", "effective_date"=>"2011-02-09", "esl"=>2, "estimating_software"=>"Xactimate 27.3", "id"=>240, "name"=>"Texas Heritage (subsidiary of Germania Ins.)", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>"Germania Insurance requires utilization of the Drying Workbook on all residential water losses.", "states_involved"=>"U. S. Franchises in TX"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F-3", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate 28", "id"=>241, "name"=>"The Hartford", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>"This is a SNAPA Account; Refer to Bulletin for special conditions.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>242, "name"=>"Torus National Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>243, "name"=>"Torus Specialty Ins. Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"3539-SF", "collect_deductible"=>"Yes, if mitigation only. If structure or contents is involved contact the adjuster to have deductible applied to that portion of the claim.", "customer_service_contacts"=>"Randy Kerlin at 1-800-216-3711.", "effective_date"=>"2009-11-08", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>244, "name"=>"Tower Hill Insurance Group", "pricing"=>"Use most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>"Tower Hill requests that Franchise is on site within 2 hours; however, Franchise must arrive within 4 hours from FNOL.  Apply antimicrobial if biohazard exists. Advise claims handler prior to removing or drilling into permanently attached items such as cabinets, basesboards, drywall, etc.", "states_involved"=>"U.S. Franchises in FL"})

  InsuranceCompany.create({"bulletin_number"=>"3383-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Richmond: 1-800-635-4543, Chantilly: 1-800-368-3562, Baltimore & Hunt Valley: 1-800-842-0091.  ", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>245, "name"=>"Travelers Mid-Atlantic", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"These guidelines do not apply to contents. If contents cleaning or packout involved, contact adjuster immediately on how to proceed.", "states_involved"=>"U.S. Franchises in DE, MD, VA, WV"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>246, "name"=>"Trumbull Insurance Co. - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3739-F", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"1-800-243-5860", "effective_date"=>"2010-11-08", "esl"=>2, "estimating_software"=>"Scaner", "id"=>247, "name"=>"Twin City Fire Ins. Co. - FOLLOW GUIDELINES FOR THE HARTFORD", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R & C", "special_conditions"=>"refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3832-SF", "collect_deductible"=>"Yes, if emergency services are performed.", "customer_service_contacts"=>"Gary Johnson, Claims Manager-800-288-8050 x 8261 Gary.johnson@uicnc.com", "effective_date"=>"2011-07-03", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>248, "name"=>"Universal Insurance Company - Pilot Program ", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Scope and upload into ScanER whether or not work is performed (compensation may be claimed for performing services)", "states_involved"=>"U.S. Franchises in KY and TN"})

  InsuranceCompany.create({"bulletin_number"=>"4980-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"1-800-425-9113, Colleen Schilling, ext. 6210", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>249, "name"=>"Universal Property & Casualty (includes Universal Holding Company of Florida, Universal Insurance Holdings, Inc., and American Platinum Prop. & Cas.)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"DE, FL, GA, HI, IN, MD, MA, MI, MN, NC, PA, SC"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F", "collect_deductible"=>"yes", "customer_service_contacts"=>"Amy Chiarelli, Vendor Program Manager, phone 847-413-5705", "effective_date"=>"2014-05-09", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>250, "name"=>"Universal Underwriters (Subsidiary of Zurich)", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F.", "property_type"=>"C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.", "states_involved"=>"Franchises in all U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4635-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Contact water mitigation specialist assigned to the file; if not available, Water Mit. Dept. at 800-628-0250 or e-mail to hanovermit@hanover.com.      After hours:  AL, FL, GA, KY, MD, NC, SC, TN, VA: 508-855-4235;        MA, CT, RI: 508-855-4237;        ME, NH, VT: 508-855-4238;        DE, NJ, NY, PA, WV: 508-855-4245;        AR, KS, LA, MO, ND, OK, SD, TX: 508-855-4243;        IA, MN, WI, and Michigan Area Codes of 248,313,586,734,810:  517-540-3280;        IN,IL,OH,AK,AZ,CA,CO,HI,ID,MT, NV, NM, OR, UT, WA, WY, Western Canada, and Michigan Area Codes of 269,906,231,616,517,989:  517-540-4811", "effective_date"=>nil, "esl"=>3, "estimating_software"=>"Xactimate, Version 28", "id"=>251, "name"=>"Verlan Fire Ins. Co. (subsidiary of Hanover Insurance)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.  Notes must be entered inDryBook.  Initial upload required.  See bulletin for other requirements.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4226-SF", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Service Center: 1-800-452-7714", "effective_date"=>"2012-11-12", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>252, "name"=>"Virginia Farm Bureau", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in VA"})

  InsuranceCompany.create({"bulletin_number"=>"3337F", "collect_deductible"=>"NO", "customer_service_contacts"=>"Claims 1-800-652-1262;  Renee’ Collins - Claims Manager Choice Product 770-763-1385 or 800-326-2845 x 11385\n(770)763-1385", "effective_date"=>"2008-03-04", "esl"=>5, "estimating_software"=>"Xactimate", "id"=>253, "name"=>"Voyager Property & Casualty Insurance (subsidiary of Assurant)", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>"If refusal of service, contact adjuster immediately and communicate scope of repairs; attempt to take photos of building and loss.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3692-SF", "collect_deductible"=>"Yes, with adjuster approval.", "customer_service_contacts"=>"Jim Todd, Sr. Claims Mgr. 515-327-2865 or 1-800-274-3531", "effective_date"=>"2010-08-06", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>254, "name"=>"Wadena Insurance (affiliated with IMT Group)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Use Drying Workbook", "states_involved"=>"U. S. States of IA, IL, NE, SD, WI"})

  InsuranceCompany.create({"bulletin_number"=>"3780-F", "collect_deductible"=>"NO.  Any coverage issues must be discussed with adjuster, not the insured.", "customer_service_contacts"=>"1) Assigned Adjuster\n2) Fireman’s Fund: Phone 800-870-8857\n", "effective_date"=>"2010-01-11", "esl"=>2, "estimating_software"=>"Xactimate for these states:  CT, DE, DC, ME, MD, MA, NH, NJ, NY, PA, RI, VT, VA.                                                ScanER for all other states.  If adjuster requests Xactimate, contact National Accounts for approval.", "id"=>255, "name"=>"Warner Insurance (Subsidiary of Fireman's Fund)", "pricing"=>"For Xactimate: Use the most current price list provided by Xactimate for your area.                       For ScanER, use Trainer regional price list.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Fireman's Fund ATP must be used  (attached to bulletin 3780-F; also on ServproNET/SNAPA/Fireman's Fund/Forms). Add'l reasons to notify adjuster: If mitigation losses exceed : personal $20,000; commercial $50,000. If material is unique (bamboo, custom, expensive, etc.), whoe-house content manipulation, inability to service loss (due to size, complexity, etc.). Use DRYING WORKBOOK.", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>256, "name"=>"Wellington Claim Service, Inc.", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>257, "name"=>"Wellington Insurance Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"3543-SF-2", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"Scott Thomas, Claims Manager-1-800-236-5010 ext 6461", "effective_date"=>nil, "esl"=>0, "estimating_software"=>" Xactimate", "id"=>258, "name"=>"West Bend Mutual Insurance", "pricing"=>"Use the most current price list provided by Xactimate® for your area.", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"U.S. Franchises in IL, IN, IA, MI, MN, OH, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4043-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-332-3226", "effective_date"=>nil, "esl"=>0, "estimating_software"=>"Scaner", "id"=>259, "name"=>"West American Insurance Company (subsidiary of Safeco)", "pricing"=>"Refer to pricelist groups in bulletin", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3752-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-332-3226", "effective_date"=>"2010-07-09", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>260, "name"=>"West American Insurance Company (subsidiary of Safeco)", "pricing"=>"Current price list", "property_type"=>"R", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"Only Participating Franchises"})

  InsuranceCompany.create({"bulletin_number"=>"4034-F", "collect_deductible"=>"Yes", "customer_service_contacts"=>"1-800-332-3226", "effective_date"=>nil, "esl"=>5, "estimating_software"=>"Under 100,000-Xactimate  Over 100,000-T&M with adjuster approval", "id"=>261, "name"=>"West American Insurance Company (subsidiary of Safeco)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Refer to bulletin", "states_involved"=>"All U.S. States"})

  InsuranceCompany.create({"bulletin_number"=>"3930-SF", "collect_deductible"=>"No", "customer_service_contacts"=>"Bob Montone, Second Vice President - Western World Insurance Group, Phone 201-847-2837, r.montone@westernworld.com, Claims Dept.: 1-888-847-8600 ", "effective_date"=>nil, "esl"=>10, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>262, "name"=>"Western World Insurance Group", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use most curent T & M Price List.", "property_type"=>"C ", "special_conditions"=>"For Franchises that offer board-up, use 1/2\" plywood OSB in windows and door openings, openings made in a building's exterior by fire, vehicle, or other type damage. For Franchises that offer Roof Temps/Tarpaulin Application: Nondestructive methods are to be used to affix the tarpaulin to roof surface when making temporary covering for shingle loss in situaations where the roof deck is undamaged. Only the portion of the roof necessary to secure areas of missing shingless or cover holes should be covered.", "states_involved"=>"U. S. Franchises in CA, OR, WA (Participation is contingent upon  approval by Western World Insurance Group and SERVPRO Commercial Large Loss Division and Large Loss Response Team.)"})

  InsuranceCompany.create({"bulletin_number"=>"4064-SF", "collect_deductible"=>"Contact the Adjuster whether to collect the deductible.", "customer_service_contacts"=>"Westfield Insurance Customer Care Center: Phone 866-937-2663, Corry Novosel: Phone 724-776-7200", "effective_date"=>"2012-03-04", "esl"=>0, "estimating_software"=>"At time of initial inspection:  Xactimate, if loss is considered to be $100,000 or less, excluding subcontract work.  Time & Materials, if loss is considered to be greater than $100,000, excluding subcontract work.", "id"=>263, "name"=>"Westfield Insurance, Westfield National Insurance", "pricing"=>"For Xactimate, use most current price list provided by Xactimate for your area.  For Time  Materials, use price list attached to bulletin.", "property_type"=>"R & C", "special_conditions"=>"SNAPA Acct.  Contact adjuster immediately and obtain direction on how to proceed if content cleaning or packout is involved (not included in this program). Water mitigation performed solely in conjunction with fire/smoke job should be included in fire/smoke estimate.  Use DRYING WORKBOOK.", "states_involved"=>"U. S. Franchises in AZ, CO, DE, FL, GA, IL, IN, IA, KY, MD, MI, MN, NM, NC, OH, PA, SC, TN, VA, WV, WI"})

  InsuranceCompany.create({"bulletin_number"=>"4099-SF-2", "collect_deductible"=>"Yes", "customer_service_contacts"=>"Claims Center Phone 800-876-8766; Fax 800-365-2562", "effective_date"=>"2014-11-04", "esl"=>3, "estimating_software"=>"Xactimate", "id"=>264, "name"=>"Wilson Mutual (subsidiary of Motorists Mutual)", "pricing"=>"Use most current price list provided by Xactimate for your area.", "property_type"=>"R & C", "special_conditions"=>"Notify adjuster of Category 1 water losses prior to removal of drywall or carpet.  LOCAL JOBS MUST BE UPLOADED.", "states_involved"=>"U. S. States of IA, IL, IN, KY, MA, ME, MI, MN, NE, NH, OH, PA, RI, SC, VT, WI, WV"})

  InsuranceCompany.create({"bulletin_number"=>"4081-SF", "collect_deductible"=>"Yes ", "customer_service_contacts"=>"Ed Campbell, Sr. Claims Manager, Phone: (717)733-8648, Ext .218, Fax: (717)733-1983", "effective_date"=>"2012-03-05", "esl"=>2, "estimating_software"=>"Xactimate", "id"=>265, "name"=>"Windsor-Mount Joy Mutual Insurance", "pricing"=>"Use the most current price list provided by Xactimate for your area.", "property_type"=>"R", "special_conditions"=>nil, "states_involved"=>"U. S. Franchises in DE, IN, MD, MA, NJ, NC, OH, PA, VA"})

  InsuranceCompany.create({"bulletin_number"=>"4916-SF", "collect_deductible"=>"yes", "customer_service_contacts"=>"800-447-6465 or 817-738-1878", "effective_date"=>nil, "esl"=>2, "estimating_software"=>"Xactimate", "id"=>266, "name"=>"Worth Casulaty Co. (subsidiary of Wellington Claim Service, Inc.)", "pricing"=>"Current price list", "property_type"=>"R & C", "special_conditions"=>nil, "states_involved"=>"TX"})

  InsuranceCompany.create({"bulletin_number"=>"4601-F-3", "collect_deductible"=>"yes", "customer_service_contacts"=>"Claims Care Center phone:  1-800-987-3373", "effective_date"=>"2016-03-07", "esl"=>0, "estimating_software"=>"Xactimate for all losses estimated at less than $50,000, excluding subcontract.  Time and Materials for all losses estimated at more than $50,000, excluding subcontract.", "id"=>267, "name"=>"Zurich", "pricing"=>"Xactimate: Use Zurich Xactimate Profile.    Time and Materials: Use T & M Price List attached to Bulletin #4601-F2.", "property_type"=>"R & C", "special_conditions"=>"THIS IS A SNAPA ACCOUNT.   Use Zurich Auth. For Repairs Form and Zurich Certificate of Satisfaction Form.", "states_involved"=>"Franchises in all U.S. States"})
  ActiveRecord::Base.connection.reset_pk_sequence!('insurance_companies')

  PhoneType.create({"id"=>1, "name"=>"Cell"})

  PhoneType.create({"id"=>2, "name"=>"Work"})

  PhoneType.create({"id"=>3, "name"=>"Home"})

  PhoneType.create({"id"=>4, "name"=>"Fax"})
  ActiveRecord::Base.connection.reset_pk_sequence!('phone_types')

  Form.create({"id"=>1, "name"=>"Payment Authorization", "package_id"=>"amUqRrobcTQo3uoRTIoVA7Y1M34=", "signer_id"=>"e7901eca-87bb-4891-9f93-51a8e44258c4", "transaction_id"=>"ad08384325cf474bf4c4075e63e38399aec3d93836c1030e"})
  ActiveRecord::Base.connection.reset_pk_sequence!('forms')

  Vendor.create({"active"=>true, "address"=>"695 EAST 132ND STREET BRONX, NY 10454", "auto"=>nil, "category_type"=>"ALARM INSTALLATION/SECURITY SYSTEM", "cellphone"=>nil, "contact"=>"JESSICA", "email"=>"JCASTRO1FES@GMAIL.COM", "fax"=>"917-631-9502", "id"=>1, "independent_contractor_agreement"=>"YES", "liability"=>"0012-02-16", "name"=>"FALCON ENGINEERED SECURITY SOLUTIONS, INC", "phone"=>"917-631-9500", "pollution"=>nil, "w9"=>"YES", "wc"=>"0012-02-16"})

  Vendor.create({"active"=>true, "address"=>"52 EAST 2ND STREET MINEOLA, NY 11501", "auto"=>nil, "category_type"=>"ARCHITECHS & ENGINEERS", "cellphone"=>nil, "contact"=>"JOE", "email"=>"JCASTRO1FES@GMAIL.COM", "fax"=>"516-456-4911", "id"=>2, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"FUTURE TECH CONSULTANTS OF NY INC.", "phone"=>"516-918-2980", "pollution"=>nil, "w9"=>"YES", "wc"=>"2017-07-05"})

  Vendor.create({"active"=>true, "address"=>"PO BOX 758 SHOREHAM, NY 11786", "auto"=>nil, "category_type"=>"ASBESTOS ABATEMENT", "cellphone"=>"516-398-8260", "contact"=>"JOHN", "email"=>"CHCOCO@OPTONLINE.NET", "fax"=>"631-929-0540", "id"=>3, "independent_contractor_agreement"=>"YES", "liability"=>"0005-03-17", "name"=>"CHESAPEAKE CONTRACTING CORP.", "phone"=>"631-929-3060", "pollution"=>"0005-03-17", "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"241-4 N. FEHR WAY BAY SHORE, NY 11706", "auto"=>nil, "category_type"=>"ASBESTOS REMOVAL", "cellphone"=>"631-872-0074", "contact"=>"TONY", "email"=>"HAZWOPPER@AOL.COM", "fax"=>"631-242-7206", "id"=>4, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"UNITECH SERVICES GROUP", "phone"=>"631-242-7215", "pollution"=>nil, "w9"=>"YES", "wc"=>"0007-01-17"})

  Vendor.create({"active"=>true, "address"=>"1600 N. OCEAN AVENUE UNIT 16 HOLTSVILLE, NY 11742", "auto"=>nil, "category_type"=>"BIO HAZARD CLEAN-UP & REMOVAL", "cellphone"=>"631-704-0085", "contact"=>"DOUG", "email"=>"DOUG@ISLANDTRAUMA.COM", "fax"=>nil, "id"=>5, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"ISLAND TRAUMA SERVICES INC.", "phone"=>"855-872-8624", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"11 HARTS LANE SUITE E EAST BRUNSWICK, NJ 08816", "auto"=>nil, "category_type"=>"BIO HAZARD CLEAN-UP & REMOVAL", "cellphone"=>nil, "contact"=>"SURI", "email"=>"FRONTOFFICE@NJMEDICALWASTE.COM", "fax"=>"732-377-8699", "id"=>6, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"NJ MEDICAL WASTE", "phone"=>"877-556-5865", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"PO BOX 824 LYNBROOK, NY 11563", "auto"=>nil, "category_type"=>"BOARD UP", "cellphone"=>nil, "contact"=>"JIM", "email"=>"INFO@CIPCOBOARDING.COM", "fax"=>"516-887-0779", "id"=>7, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"CIPCO BOARDING CO.", "phone"=>"516-536-1135", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"83 SPRUCE STREET BLOOMFIELD, NJ 07003", "auto"=>nil, "category_type"=>"BOARD UP", "cellphone"=>"201-421-0118", "contact"=>"GILLY", "email"=>"GILLYBUP@AOL.COM", "fax"=>"973-302-4773", "id"=>8, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"G-SIX ENTERPRISES, LLC", "phone"=>"201-421-0117", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"398 WEST END AVE. SHIRLEY, NY 11967", "auto"=>nil, "category_type"=>"BOARD UP", "cellphone"=>"SAME AS MAIN #", "contact"=>"KEITH", "email"=>"ULTIMATEBOARDUP@YAHOO.COM", "fax"=>"631-395-4637", "id"=>9, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"ULTIMATE BOARD UP", "phone"=>"631-438-6060", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"18 WILSON ST, BRENTWOOD, NY 11717", "auto"=>nil, "category_type"=>"BOARD UP", "cellphone"=>"631-327-4300", "contact"=>"TONY", "email"=>"EMERGENCY@USABOARDUP.COM", "fax"=>"631-231-0009", "id"=>10, "independent_contractor_agreement"=>"YES", "liability"=>"0010-03-17", "name"=>"USA EMERGENCY BOARD UP INC", "phone"=>"631-231-3338", "pollution"=>nil, "w9"=>"YES", "wc"=>"0010-05-17"})

  Vendor.create({"active"=>true, "address"=>"PO BOX 392 ELVERSON, PA 19520", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>"610-942-2517", "contact"=>"ANTHONY", "email"=>nil, "fax"=>"610-942-2495", "id"=>11, "independent_contractor_agreement"=>"YES", "liability"=>"0007-01-17", "name"=>"A.J BLOSENSKI, INC", "phone"=>"610-942-2707", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"78 FOREST AVENUE FREEPORT, NY 11520", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>"516-445-1173", "contact"=>"JULIO", "email"=>"JBONILLA2883@YAHOO.COM", "fax"=>nil, "id"=>12, "independent_contractor_agreement"=>"YES", "liability"=>"0003-06-17", "name"=>"B BROS C & C CORP.", "phone"=>"516-860-5859", "pollution"=>nil, "w9"=>"YES", "wc"=>"0003-10-17"})

  Vendor.create({"active"=>true, "address"=>"3 RAILROAD PLACE, MASPETH, NY 11378", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>"SAME AS MAIN #", "contact"=>nil, "email"=>"INFO@BOROWIDERECYCLING.COM", "fax"=>"718-416-1913", "id"=>13, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"BORO-WIDE RECYCLING CORP", "phone"=>"718-326-7149", "pollution"=>nil, "w9"=>"YES", "wc"=>"0007-01-17"})

  Vendor.create({"active"=>true, "address"=>"101 COMMERCE DRIVE TINTON FALLS, NJ 07753", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>nil, "contact"=>nil, "email"=>nil, "fax"=>"732-988-8333", "id"=>14, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DELISA DEMOLITION", "phone"=>"732-988-2525", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"114 RAILROAD STREET HUNTINGTON STATION, NY 11746", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>"516-860-4978", "contact"=>"PAT", "email"=>"FBCARTING@GMAIL.COM", "fax"=>nil, "id"=>15, "independent_contractor_agreement"=>"YES", "liability"=>"0010-03-17", "name"=>"FRANCO BROS. CARTING CORP.", "phone"=>"631-673-2252", "pollution"=>nil, "w9"=>"YES", "wc"=>"0009-03-17"})

  Vendor.create({"active"=>true, "address"=>"112 PHYLIS COURT ELMONT, NY 11003", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>"917-731-8626", "contact"=>"STEPHEN", "email"=>"MICH0914@HOTMAIL.COM", "fax"=>"516-354-6762", "id"=>16, "independent_contractor_agreement"=>"YES", "liability"=>"0005-07-17", "name"=>"LIBERTY ASHES INC.", "phone"=>"718-739-7224 X214", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"PO BOX 188 LINCROFT, NEW JERSEY 07738", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>"N/A", "contact"=>"JULIE", "email"=>"CAFIEROC@REPSRV.COM", "fax"=>"732-542-2958", "id"=>17, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"MARPAL DISPOSAL / REPUBLIC SERVICES INC", "phone"=>"732-542-2348 / 800-660-0696", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"1198 PROSPECT AVENUE WESTBURY, NY 11590", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>nil, "contact"=>"(Corp. office in A.Z. Local locations service P.A. & N.J.)", "email"=>"NGUSMAN@REPUBLICSERVICES.COM", "fax"=>nil, "id"=>18, "independent_contractor_agreement"=>"N/A", "liability"=>nil, "name"=>"REPUBLIC SERVICES d/b/a MIDCO WASTE", "phone"=>"732-545-8988", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"47 KATRINA FALLS ROAD ROCK HILL, NY 12775", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>nil, "contact"=>nil, "email"=>"TSCHAULERS@AOL.COM", "fax"=>"845-796-1033", "id"=>19, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"THOMPSON SANITATION", "phone"=>"845-796-1032", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"1198 PROSPECT AVENUE WESTBURY, NY 11590", "auto"=>nil, "category_type"=>"CARTING", "cellphone"=>nil, "contact"=>nil, "email"=>"GKROHN@WINTERSBROS.COM", "fax"=>"516-334-3264", "id"=>20, "independent_contractor_agreement"=>"YES", "liability"=>"0001-01-17", "name"=>"WINTERS BROS. HAULING OF LONG ISLAND, LLC", "phone"=>"516-937-0900", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"65-04 MYRTLE AVENUE GLENDALE, NY 11385", "auto"=>"0004-01-17", "category_type"=>"CARPET/FLOORING", "cellphone"=>nil, "contact"=>"JOAN", "email"=>"BAYCARPET@YAHOO.COM", "fax"=>"718-628-4813", "id"=>21, "independent_contractor_agreement"=>"YES", "liability"=>"0004-01-17", "name"=>"BAY CARPET", "phone"=>"718-366-5001", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"PO BOX 802 BAYPORT, NY 11705", "auto"=>nil, "category_type"=>"CARPET/FLOORING", "cellphone"=>"631-472-0757", "contact"=>"JILL", "email"=>"DRSTEAMER123@AOL.COM", "fax"=>nil, "id"=>22, "independent_contractor_agreement"=>"YES", "liability"=>"0006-03-17", "name"=>"DR. STEAMER", "phone"=>"631-289-1515 OR 631-289-1729", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"55 REMINGTON BLVD. RONKONKOMA, NY 11779", "auto"=>nil, "category_type"=>"CARPET/FLOORING", "cellphone"=>"SAME AS MAIN #", "contact"=>"STEPHEN", "email"=>"FINALTOUCHFLOORINGSB@YAHOO.COM", "fax"=>"631-676-5577", "id"=>23, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"FINAL TOUCH FLOORING CORP.", "phone"=>"631-676-5566", "pollution"=>nil, "w9"=>"YES", "wc"=>"0007-11-17"})

  Vendor.create({"active"=>true, "address"=>"263 JERICHO TPKE. FLORAL PARK, NY 11001", "auto"=>nil, "category_type"=>"CARPET/FLOORING", "cellphone"=>"516-315-5535", "contact"=>"BURT / JUDY", "email"=>nil, "fax"=>"516-352-0892", "id"=>24, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"FLORAL PARK DESIGNS", "phone"=>"516-352-1323", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"34 EATONDALE AVENUE BLUE POINT, NY 11716", "auto"=>nil, "category_type"=>"CARPET/FLOORING", "cellphone"=>"SAME AS MAIN #", "contact"=>"NICK", "email"=>"JOJO1050@OPTONLINE.NET", "fax"=>"631-419-6087", "id"=>25, "independent_contractor_agreement"=>"YES", "liability"=>"0012-11-16", "name"=>"NICK D CARPET INSTALLATION INC.", "phone"=>"631-374-0423", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"11 COLEMAN STREET HAZLET, NJ 07734", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"718-986-8821", "contact"=>"ANTHONY", "email"=>"AANDC81@GMAIL.COM", "fax"=>"732-787-5195", "id"=>26, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"A & C HOME REMODELING", "phone"=>"732-787-5195", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"667 GRAND AVENUE LINDENHURST, NY 11757", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"516-242-2183", "contact"=>nil, "email"=>"ACCMECHWKS@AOL.COM", "fax"=>nil, "id"=>27, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"ACCURATE MECHANICAL WORKS, INC.", "phone"=>"631-884-0968", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"343 CHAMBERS AVENUE EAST MEADOW, NY 11554", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"ROB", "email"=>"ALBANOCONTRACTING21@GMAIL.COM", "fax"=>nil, "id"=>28, "independent_contractor_agreement"=>"YES", "liability"=>"0011-01-16", "name"=>"ALBANO CONTRACTING", "phone"=>"516-369-0732", "pollution"=>nil, "w9"=>"YES", "wc"=>"0003-02-17"})

  Vendor.create({"active"=>true, "address"=>"262 ELLINGTON ROAD SOUTH WINDSOR, CT 06074", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"JAMES KONODCHUK", "email"=>nil, "fax"=>"860-282-2231", "id"=>29, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"BATH SOLUTIONS DBA BATH FITTERS", "phone"=>"860-282-2230", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"115-85 SPRINGFIELD BLVD, CAMBRIA HEIGHTS, NY 11411", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"CHRIS BAILEY", "email"=>"NOEL_CHRISBAILEY@YAHOO.COM", "fax"=>nil, "id"=>30, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"CHRISTOPHER BAILEY COMPANY", "phone"=>"917-287-1538", "pollution"=>nil, "w9"=>"YES", "wc"=>"0009-01-17"})

  Vendor.create({"active"=>true, "address"=>"16 EBBTIDE LANE DIX HILLS, NY 11746", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"917-299-3777", "contact"=>"ROY", "email"=>"OFFICEINTERIORS@OPTONLINE.NET", "fax"=>"631-901-1030", "id"=>31, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"COMPLETE OFFICE INTERIORS", "phone"=>"631-901-1028 OR 877-215-8280", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"3116 EXPRESSWAY DR. S. ISLANDIA, NY 11749", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>nil, "email"=>"DDOLAN@DJJTECHNOLOGIES.COM", "fax"=>"631-787-5063", "id"=>32, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DJJ TECHNOLOGIES", "phone"=>"631-787-5062", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"126 WILLIAM STREET FARMINGDALE, NY 11735", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"516-790-1492", "contact"=>"ROB", "email"=>"FAIRANDSQUAREINC@GMAIL.COM", "fax"=>"516-345-1649", "id"=>33, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"FAIR AND SQUARE CONTRACTING INC.", "phone"=>"516-586-4249", "pollution"=>nil, "w9"=>"YES", "wc"=>"0005-03-17"})

  Vendor.create({"active"=>true, "address"=>"75 PARKHURST STREET NEWARK, NJ 07114", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"917-547-4755 or ELSON 201-600-9258", "contact"=>"ELSON DASILVA", "email"=>"DVJ.SERVICECONSTRUCTION@GMAIL.COM", "fax"=>nil, "id"=>34, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DVJ SERVICE CONSTRUCTION LLC", "phone"=>"201-479-2574", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"120 NORTH OCEAN AVENUE FREEPORT, NY 11520", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"516-523-4825", "contact"=>"GEORGE", "email"=>"JEAN4GEORGE@YAHOO.COM", "fax"=>nil, "id"=>35, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"G & D RESTORATION CORP.", "phone"=>"516-868-0305", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"554 A UNIT D WEST BROADWAY PORT JEFFERSON, NY 11777", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"PAUL ", "email"=>"GOODTOGOINC@GMAIL.COM", "fax"=>nil, "id"=>36, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"GOOD TO GO MAINTENANCE INC.", "phone"=>"631-403-7855", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"44 NORTH MAIN STREET MILLTOWN, NJ 08850", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"908-930-0593", "contact"=>"MIKE OR BARBARA", "email"=>"MIKE@HANNASSERVICES.COM", "fax"=>"732-249-6911", "id"=>37, "independent_contractor_agreement"=>"YES", "liability"=>"0003-05-17", "name"=>"HANNA'S MECHANICAL CONTRACTORS", "phone"=>"732-249-4911", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"73 DEER LANE MANORVILLE, NY 11949", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"SAL", "email"=>"ISLANDFLOORS@HOTMAIL.COM", "fax"=>nil, "id"=>38, "independent_contractor_agreement"=>"YES", "liability"=>"0005-08-17", "name"=>"ISLAND FLOORS & CONSTRUCTION", "phone"=>"631-839-7397", "pollution"=>nil, "w9"=>"YES", "wc"=>"0008-05-17"})

  Vendor.create({"active"=>true, "address"=>"100 B KNICKERBOCKER AVENUE BOHEMIA, NY 11716", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>nil, "email"=>"JNBINTERIORS@AOL.COM", "fax"=>"631-244-0005", "id"=>39, "independent_contractor_agreement"=>"YES", "liability"=>"0009-05-17", "name"=>"JNB INTERIORS", "phone"=>"631-244-0098", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"429 SCHECGER AVE E PATCHOGUE, NY 11772", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"LEWIS LEE", "email"=>nil, "fax"=>nil, "id"=>40, "independent_contractor_agreement"=>nil, "liability"=>"0011-05-16", "name"=>"LL BUILDER LI, INC", "phone"=>"631-764-2407", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"419 A GREAT EASK NECK ROAD WEST BABYLON, NY 11704", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"GARY", "email"=>nil, "fax"=>"631-482-9561", "id"=>41, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"MARCOR CONSTRUCTION INC.", "phone"=>"631-321-0593", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"124 EASTWOOD AVENUE DEER PARK, NY 11729", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"516-790-4973", "contact"=>"ROSARIO", "email"=>"ROS6TAL@GMAIL.COM", "fax"=>nil, "id"=>42, "independent_contractor_agreement"=>"YES", "liability"=>"0008-07-17", "name"=>"MILANO TILE", "phone"=>"631-940-1762", "pollution"=>nil, "w9"=>"YES", "wc"=>"0006-05-17"})

  Vendor.create({"active"=>true, "address"=>"9272 JERONIMO RD-SUITE 119 IRVINE, CA 92618", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"ERICA SIEGAL", "email"=>nil, "fax"=>nil, "id"=>43, "independent_contractor_agreement"=>nil, "liability"=>nil, "name"=>"MIWA LOCK COMPANY LTD.", "phone"=>nil, "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"180 MILLER PLACE HICKSVILLE, NY 11801", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"NICK", "email"=>"NGRGAS@NATIONALINSULATIONGCCORP.COM", "fax"=>"516-624-9715", "id"=>44, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"NATIONAL INSULATION & GC CORP.", "phone"=>"516-624-9711", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"14 TUCKAHOE ROAD SOUND BEACH, NY 11789", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"631-745-7128", "contact"=>"PAUL ", "email"=>"NEWHORIZONHOMESINC@GMAIL.COM", "fax"=>nil, "id"=>45, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"NEW HORIZON HOMES, INC", "phone"=>"631-615-2625", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"1007 SADDLE ROCK ROAD HOLBROOK, NY 11741", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"631-774-7769", "contact"=>"MANNY", "email"=>"NEWISLANDREMODELING@YAHOO.COM", "fax"=>nil, "id"=>46, "independent_contractor_agreement"=>"YES", "liability"=>"0012-12-16", "name"=>"NEW ISLAND REMODELING", "phone"=>"631-831-7922", "pollution"=>nil, "w9"=>"YES", "wc"=>"0012-04-16"})

  Vendor.create({"active"=>true, "address"=>"24 SHELL ROAD ROCKY POINT, NY 11778", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"RAY", "email"=>"NITD123@HOTMAIL.COM", "fax"=>"631-228-4171", "id"=>47, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"NEW IMAGE HOME REMODELING", "phone"=>"631-774-7769", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"472 PEPPER STREET MONROE, CT 06468", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"203-395-3300", "contact"=>"ANGELO", "email"=>"ALISI@NRLFIREPRO.COM", "fax"=>"203-261-1131", "id"=>48, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"NRL FIRE PROTECTION SERVICES", "phone"=>"845-278-4333", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"17 DEWITT PLACE NEW ROCHELLE, NY 10801", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"JOE", "email"=>"FAROSSIGNUOLO@GMAIL.COM", "fax"=>nil, "id"=>49, "independent_contractor_agreement"=>"YES", "liability"=>"0003-10-17", "name"=>"PFA CONTRACTING INC.", "phone"=>nil, "pollution"=>nil, "w9"=>"YES", "wc"=>"0003-10-17"})

  Vendor.create({"active"=>true, "address"=>"65 B AIR PARK DRIVE RONKONKOMA, NY 11779", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>"SAME AS MAIN #", "contact"=>"EUGENE", "email"=>"EUGENE@ROCKETINSULATIONNY.COM", "fax"=>"631-750-9076", "id"=>50, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"ROCKET INSULATIONS & COATINGS INC.", "phone"=>"631-750-9075", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"195 KNICKERBOCKER AVE. SUITE 3 BOHEMIA, NY 11716", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"TOMMY", "email"=>"RTDAC@OPTONLINE.NET", "fax"=>"631-567-3896", "id"=>51, "independent_contractor_agreement"=>"YES", "liability"=>"0004-08-17", "name"=>"RTD CONTRACTING LTD.", "phone"=>"631-567-3809", "pollution"=>nil, "w9"=>"YES", "wc"=>"0005-01-17"})

  Vendor.create({"active"=>true, "address"=>"PO BOX 413 GOLDENS BRIDGE, NY 10526", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"JIM", "email"=>"SSHARP@STILLWELLSTARIS.COM", "fax"=>nil, "id"=>52, "independent_contractor_agreement"=>"NONE ON FILE", "liability"=>nil, "name"=>"STILLWELL STAIRS & RAILINGS, INC.", "phone"=>"914-232-3114", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"PO BOX 688 SAINT JAMES, NY 11780", "auto"=>nil, "category_type"=>"CONSTRUCTION", "cellphone"=>nil, "contact"=>"VINNY", "email"=>"WAVECRESTBUILDERS@GMAIL.COM", "fax"=>nil, "id"=>53, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"WAVE CREST BUILDERS LLC", "phone"=>"631-506-3964", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"18 6TH STREET SOUND BEACH, NY 11789", "auto"=>nil, "category_type"=>"CONSTRUCTION SURVEYOR", "cellphone"=>nil, "contact"=>"LEE", "email"=>"LEED12@HOTMAIL.COM", "fax"=>"631-821-3425", "id"=>54, "independent_contractor_agreement"=>"N/A", "liability"=>nil, "name"=>"HARRIS LAYOUT INC.", "phone"=>"631-766-6320", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"206 LINCOLN STREET RIVERHEAD, NY 11901", "auto"=>nil, "category_type"=>"CONSTRUCTION SURVEYOR", "cellphone"=>nil, "contact"=>nil, "email"=>"MBUTLER75@MAC.COM", "fax"=>nil, "id"=>55, "independent_contractor_agreement"=>"NONE ON FILE", "liability"=>nil, "name"=>"JEFFREY T. BUTLER", "phone"=>nil, "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"400 WEST UNION AVENUE BOUND BROOK, NJ 08805", "auto"=>"0004-04-17", "category_type"=>"DRY CLEANING", "cellphone"=>nil, "contact"=>"ANTHONY", "email"=>"ANTHONYDELGAIZO@HOTMAIL.COM", "fax"=>"732-356-2642", "id"=>56, "independent_contractor_agreement"=>"YES", "liability"=>"0004-04-17", "name"=>"CRDN OF NJ", "phone"=>"877-879-2736", "pollution"=>nil, "w9"=>"YES", "wc"=>"0006-01-17"})

  Vendor.create({"active"=>true, "address"=>"25 AMITY STREET LITTLE FALLS, NJ 07424", "auto"=>nil, "category_type"=>"DRY CLEANING", "cellphone"=>"JUAN 201-749-3914", "contact"=>"ANGEL OR JUAN", "email"=>"JUAN.GAONA@QUALITYCARERESTORATION.COM", "fax"=>"973-850-6379", "id"=>57, "independent_contractor_agreement"=>"NONE ON FILE", "liability"=>nil, "name"=>"QUALITY CARE CLEANERS", "phone"=>"ANGEL 347-977-0198", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"216 N. FEHR WAY SUITE B BAY SHORE, NY 11706", "auto"=>nil, "category_type"=>"DRYING & DEHUMIDIFICATION", "cellphone"=>"516-551-7575", "contact"=>"THOMAS / CATHY", "email"=>"DTIDRY@AOL.COM", "fax"=>"631-231-5428", "id"=>58, "independent_contractor_agreement"=>"YES", "liability"=>"0003-11-17", "name"=>"DRYING TECHNOLOGIES", "phone"=>"631-231-5427", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"869 SYLVAN AVENUE BAYPORT, NY 11705", "auto"=>nil, "category_type"=>"DUCT CLEANING", "cellphone"=>"516-991-8397-Marlin", "contact"=>"GINA", "email"=>"CVALDES@CUNNINGHAMDUCT.COM", "fax"=>"631-665-5378", "id"=>59, "independent_contractor_agreement"=>"YES", "liability"=>"0011-05-16", "name"=>"CUNNINGHAM DUCT CLEANING", "phone"=>"631-665-6400", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"262 ORINOCO DRIVE BRIGHTWATERS, NY 11718", "auto"=>nil, "category_type"=>"ELECTRIC", "cellphone"=>"631-236-2201", "contact"=>"RICH", "email"=>"ALLWAYSELECTRIC@AOL.COM", "fax"=>"631-666-0479", "id"=>60, "independent_contractor_agreement"=>"YES", "liability"=>"0002-08-17", "name"=>"ALL WAYS ELECTRIC", "phone"=>"631-666-0477", "pollution"=>nil, "w9"=>"YES", "wc"=>"0011-01-17"})

  Vendor.create({"active"=>true, "address"=>"8 JOHNSON STREET STATEN ISLAND, NY 10309", "auto"=>nil, "category_type"=>"ELECTRIC", "cellphone"=>"917-754-1261", "contact"=>"NICK", "email"=>"SISOLARPOWER@AOL.COM", "fax"=>"718-987-2357", "id"=>61, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"AMPAK ELECTRICAL SERVICES", "phone"=>"718-984-6224", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"7 OLD POST ROAD PORT JEFFERSON, NY 11777", "auto"=>nil, "category_type"=>"ELECTRIC", "cellphone"=>nil, "contact"=>"DAVID", "email"=>"DARLINGELECTRIC@GMAIL.COM", "fax"=>nil, "id"=>62, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DARLING ELECTRIC CORP.", "phone"=>"631-433-7164", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"27 SAINT CHARLES STREET SUITE 2 THORNWOOD, NY 10594", "auto"=>nil, "category_type"=>"ELECTRIC", "cellphone"=>nil, "contact"=>nil, "email"=>"SUSAN@DURO-ELECTRIC.COM", "fax"=>"914-769-1091", "id"=>63, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DURO ELECTRICAL CONTRACTORS", "phone"=>"914-741-6722", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"181 MONROE STREET MASTIC, NY 11950", "auto"=>nil, "category_type"=>"ELECTRIC ", "cellphone"=>"SAME AS MAIN #", "contact"=>"TONY", "email"=>"TONYPUBINS@GMAIL.COM", "fax"=>"631-772-7429", "id"=>64, "independent_contractor_agreement"=>"YES", "liability"=>"0004-11-17", "name"=>"LINEAR ELECTRICAL CONTRACTING", "phone"=>"631-882-3555", "pollution"=>nil, "w9"=>"YES", "wc"=>"0005-06-17"})

  Vendor.create({"active"=>true, "address"=>"36-6A CARLOUGH ROAD BOHEMIA, NY 11716", "auto"=>nil, "category_type"=>"ELECTRIC", "cellphone"=>"SAME AS MAIN #", "contact"=>"ROBERT", "email"=>"INFO@NORTHSTARELECTRICLI.COM", "fax"=>"631-218-6830", "id"=>65, "independent_contractor_agreement"=>"YES", "liability"=>"0003-08-17", "name"=>"NORTHSTAR ELECTRICAL CONTRACTING", "phone"=>"631-218-6831", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"62 RIVERVIEW AVE. EDISON, NJ 08817", "auto"=>nil, "category_type"=>"ELECTRIC", "cellphone"=>"732-522-5339", "contact"=>"BILL", "email"=>"STRAWBRIDGEELECTRIC@COMCAST.NET", "fax"=>"732-572-1601", "id"=>66, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"STRAWBRIDGE ELECTRIC", "phone"=>"732-572-1600", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"342 ASTOR DR. SAYVILLE, NY 11782", "auto"=>"0003-02-17", "category_type"=>"ELECTRIC", "cellphone"=>"631-872-3590", "contact"=>"THOMAS", "email"=>"TFCELECTRIC@GMAIL.COM", "fax"=>"631-567-2600", "id"=>67, "independent_contractor_agreement"=>"YES", "liability"=>"0011-08-17", "name"=>"TFC ELECTRIC", "phone"=>"631-589-2800", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"74 COBBLESTONE DRIVE SHOREHAM, NY 11786", "auto"=>nil, "category_type"=>"ENVIRONMENTAL CLEAN UP", "cellphone"=>nil, "contact"=>"HARRY", "email"=>"SILVERWOLFINC@AOL.COM", "fax"=>"631-821-4209", "id"=>68, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"SILVER WOLF ENVIRONMENTAL, INC", "phone"=>"631-806-8018", "pollution"=>nil, "w9"=>"YES", "wc"=>"0002-06-17"})

  Vendor.create({"active"=>true, "address"=>"3358 LUKES POND ROAD BRANCHBURG, NJ 08876", "auto"=>nil, "category_type"=>"ENVIRONMENTAL CLEAN UP", "cellphone"=>nil, "contact"=>"STEVE", "email"=>"SKENV@VERIZON.NET", "fax"=>nil, "id"=>69, "independent_contractor_agreement"=>"N/A", "liability"=>"0004-01-17", "name"=>"SK ENVIRONMENTAL ASSOCIATES, LLC", "phone"=>"908-722-1467", "pollution"=>"0004-01-17", "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"90 EAST HALSEY ROAD  SUITE 103 PARSIPPANY, NJ 07054", "auto"=>nil, "category_type"=>"FIRE & SMOKE", "cellphone"=>"732-800-1157", "contact"=>"BRIAN", "email"=>"BRIANCARTON@JDCARTON.COM", "fax"=>"973-386-1694", "id"=>70, "independent_contractor_agreement"=>"YES", "liability"=>"0006-04-17", "name"=>"J.D. CARTON & SON, INC.", "phone"=>"973-781-1600 X108", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"PO BOX 236 BROOKHAVEN, NY 11719", "auto"=>"0012-03-16", "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"631-445-5928", "contact"=>"DYLAN", "email"=>"ALWAYSRESTORATION@GMAIL.COM", "fax"=>"SAME AS MAIN #", "id"=>71, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"ALWAYS RESTORATION", "phone"=>"631-803-0037", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-10-17"})

  Vendor.create({"active"=>true, "address"=>"51 JOAN AVENUE CENTEREACH, NY 11720", "auto"=>"0008-02-17", "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"DOMINICK MANIERI", "email"=>"DOMINICK@CATEGORY3LLC.COM", "fax"=>nil, "id"=>72, "independent_contractor_agreement"=>"YES", "liability"=>"0001-12-17", "name"=>"CATEGORY 3, LLC ", "phone"=>"631-512-5238", "pollution"=>"0001-12-17", "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"75 PARKHURST STREET NEWARK, NJ 07114", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"201-600-9258", "contact"=>"ELSON DASILVA", "email"=>"INFO@DVJSC.COM", "fax"=>nil, "id"=>73, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DVJ EZ SOLUTIONS LLC", "phone"=>"201-479-2574", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"31-22 103RD STREET EAST ELMHURST, NY 11369", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"917-731-7973", "contact"=>"ALEX", "email"=>"NARVAEZCLEANINGCORP@YAHOO.COM", "fax"=>"SAME AS MAIN #", "id"=>74, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"EXCELLENT JOB CLEANING CORP.", "phone"=>"718-507-8634", "pollution"=>nil, "w9"=>"YES", "wc"=>"0007-01-17"})

  Vendor.create({"active"=>true, "address"=>"77-42 MAIN STREET SUITE 2A FLUSHING, NY 11367", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"JAMES STEFFENS", "email"=>"PROFESSIONALCLEANING38@HOTMAIL.COM", "fax"=>"718-264-0005", "id"=>75, "independent_contractor_agreement"=>"YES", "liability"=>"0009-06-17", "name"=>"EXQUISITE RESTORATION CORP.", "phone"=>"917-731-1603", "pollution"=>"0009-06-17", "w9"=>"YES", "wc"=>"0010-01-17"})

  Vendor.create({"active"=>true, "address"=>"37-63 83RD STREET, #214, JACKSON HEIGHTS, NY 11372", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"SAME AS MAIN #", "contact"=>"WILSON/GLORIA", "email"=>"GANDCCLEANINGSERVICESINC@YAHOO.COM", "fax"=>"347-642-3275", "id"=>76, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"G & C CLEANING SERVICES INC. (FORMERLY GLORIA'S)", "phone"=>"917-577-3120", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"92-14 50TH AVENUE ELMHURST, NY 11373", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"MIGUEL", "email"=>"GCSNY@YAHOO.COM", "fax"=>nil, "id"=>77, "independent_contractor_agreement"=>"YES", "liability"=>"0008-06-16", "name"=>"GCS ENTERPRISE CORP.", "phone"=>"347-832-1119", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"1713 COLDEN AVENUE BRONX, NY 10462", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"MIKE", "email"=>"MIKEGONZALEZ0704@GMAIL.COM", "fax"=>nil, "id"=>78, "independent_contractor_agreement"=>"YES", "liability"=>"0009-03-17", "name"=>"G & L's SERVICE CORP.", "phone"=>"     718-807-1188", "pollution"=>"0009-03-17", "w9"=>"YES", "wc"=>"0009-01-17"})

  Vendor.create({"active"=>true, "address"=>"231 BROOKLYN AVENUE WESTBURY, NY 11590", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"DAMIAN", "email"=>"HDR-RESTORATION@HOTMAIL.COM", "fax"=>"516-414-2318", "id"=>79, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"HDR RESTORATION CORP.", "phone"=>"631-624-0287", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"35-23 89TH STREET 1ST FLOOR JACKSON HEIGHTS, NY 11372", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"MARLENE", "email"=>"MS.CLEANINGSERVICEMM@GMAIL.COM", "fax"=>"347-848-0141", "id"=>80, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"MS CLEANING SERVICE", "phone"=>"347-484-7909", "pollution"=>nil, "w9"=>"YES", "wc"=>"0008-04-17"})

  Vendor.create({"active"=>true, "address"=>"500 PECONIC STREET 223A RONKONKOMA, NY 11779", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"631-790-5417", "contact"=>"JAY", "email"=>"JAYO.SERVPRO@GMAIL.COM", "fax"=>"631-648-4858", "id"=>81, "independent_contractor_agreement"=>"YES", "liability"=>"0005-02-17", "name"=>"RESTORE 24 SERVICES", "phone"=>nil, "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"35-07 147TH STREET APT. 2F FLUSHING, NY 11354", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"ALT. CONTACT: RENE 917-217-2431", "contact"=>"WILLIAM / PATRICIA", "email"=>"PATRICIA197007@YAHOO.COM", "fax"=>"718-461-2963", "id"=>82, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"SAPPHIRE RESTORATION", "phone"=>"WILLIAM- 917-939-0661 / PATRICIA- 917-337-1099", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-09-17"})

  Vendor.create({"active"=>true, "address"=>"34-21 78TH STREET SUITE 4D JACKSON HEIGHTS, NY 11732", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"SAME AS MAIN #", "contact"=>"WILSON", "email"=>"WILSONSMYLER@GMAIL.COM", "fax"=>nil, "id"=>83, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"SMYLER & SMYLER", "phone"=>"917-444-2165", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"45-79 161ST STREET FLUSHING, NY 11358", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>nil, "contact"=>"LORENA", "email"=>"SPARKLEANCORP@GMAIL.COM", "fax"=>"718-886-0265", "id"=>84, "independent_contractor_agreement"=>"YES", "liability"=>"0010-07-16", "name"=>"SPARKLEAN CLEANING & SUPPLIES CORP.", "phone"=>"718-886-0263", "pollution"=>"0010-07-16", "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"241-4 N. FEHR WAY BAY SHORE, NY 11706", "auto"=>nil, "category_type"=>"FIRE/SMOKE/WATER/MOLD", "cellphone"=>"631-872-0074", "contact"=>"TONY", "email"=>"HAZWOPPER@AOL.COM", "fax"=>"631-242-7206", "id"=>85, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"SPARKLEAN CLEANING & SUPPLIES CORP.", "phone"=>"631-242-7215", "pollution"=>nil, "w9"=>"YES", "wc"=>"0007-01-17"})

  Vendor.create({"active"=>true, "address"=>"614 DELMORE AVE. S. SOUTH PLAINFIELD, NJ 07080", "auto"=>nil, "category_type"=>"FURNITURE REPAIR", "cellphone"=>"N/A", "contact"=>"DAVID", "email"=>"FMEDICNJ@GMAIL.COM", "fax"=>"908-756-2863", "id"=>86, "independent_contractor_agreement"=>"NONE ON FILE", "liability"=>nil, "name"=>"FURNITURE MEDIC OF SOUTH PLAINFIELD", "phone"=>"908-755-8440", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"99 FLORIDA STREET FARMINGDALE, NY 11735", "auto"=>nil, "category_type"=>"FURNITURE REPAIR", "cellphone"=>"N/A", "contact"=>nil, "email"=>"MGLEASON@FURNITUREMEDICNY.COM", "fax"=>"516-333-0805", "id"=>87, "independent_contractor_agreement"=>"YES", "liability"=>"0012-10-16", "name"=>"FURNITURE MEDIC OF WESTBURY", "phone"=>"516-333-9090", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"3205 ROUTE 112 MEDFORD, NY 11763", "auto"=>"0005-01-17", "category_type"=>"HVAC", "cellphone"=>"631-681-5598", "contact"=>"CHRIS", "email"=>"CHRIS@DANISIENERGY.COM", "fax"=>nil, "id"=>88, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"DANISI ENERGY CO.", "phone"=>"631-732-6666", "pollution"=>nil, "w9"=>"YES", "wc"=>"0011-01-17"})

  Vendor.create({"active"=>true, "address"=>"50 GEAR AVE. LINDENHURST, NY 11757", "auto"=>nil, "category_type"=>"                HVAC", "cellphone"=>"RICK 516-351-1878", "contact"=>"RICK", "email"=>"NTREZZA@AARCOENVIRONMENTAL.COM", "fax"=>"631-586-5910", "id"=>89, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"AARCO ENVIRONMENTAL SERVICES", "phone"=>"631-586-5900", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"171 EAST INDUSTRY COURT DEER PARK, NY 11729", "auto"=>nil, "category_type"=>"          ICE PELLETS", "cellphone"=>nil, "contact"=>"ROSE", "email"=>"RGLASSMAN@APPLEICE.COM", "fax"=>"631-254-0192", "id"=>90, "independent_contractor_agreement"=>"N/A", "liability"=>nil, "name"=>"APPLE ICE", "phone"=>"631-254-0071", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"28 EASTWOOD BLVD. CENTEREACH, NY 11720", "auto"=>nil, "category_type"=>"INDUSTRIAL HYGENIST", "cellphone"=>nil, "contact"=>"MICHELLE", "email"=>"ADMIN@BLUESKYNOW.COM", "fax"=>"631-517-9202", "id"=>91, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"BLUE SKY INSPECTIONS", "phone"=>"631-902-1636", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"538 BROAD HOLLOW ROAD MELVILLE, NY 11747", "auto"=>nil, "category_type"=>"INDUSTRIAL HYGENIST", "cellphone"=>"WHEN CONTACTING DAVE, USE FAX ONLY", "contact"=>"DEBBIE MATTINA", "email"=>"DMATTINA@H2M.COM", "fax"=>"631-694-4122", "id"=>92, "independent_contractor_agreement"=>"YES", "liability"=>"0001-01-17", "name"=>"H2M ", "phone"=>"631-756-8000", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"74 EAST MAIN STREET SUITE 1 PATCHOGUE, NY 11772", "auto"=>nil, "category_type"=>"INDUSTRIAL HYGENIST", "cellphone"=>nil, "contact"=>nil, "email"=>"ANDREA@INSIGHTENVIRONMENTAL.COM", "fax"=>"631-654-2781", "id"=>93, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"INSIGHT ENVIRONMENTAL", "phone"=>"631-654-2780", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"4032 SUNRISE HIGHWAY SEAFORD, NY 11783", "auto"=>nil, "category_type"=>"INTERCOM/VIDEO", "cellphone"=>nil, "contact"=>"TUYET", "email"=>"TUYET@HOMETHEATER.BIZ", "fax"=>"516-679-9701", "id"=>94, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"S-N-S HOME ENTERTAINMENT", "phone"=>"516-679-9700", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"3 QUAIL HOLLOW COURT ST. JAMES, NY 11780", "auto"=>nil, "category_type"=>"MASONRY", "cellphone"=>nil, "contact"=>nil, "email"=>nil, "fax"=>nil, "id"=>95, "independent_contractor_agreement"=>"YES", "liability"=>"0003-03-17", "name"=>"SCOTTY'S MASONRY LLC", "phone"=>nil, "pollution"=>nil, "w9"=>"YES", "wc"=>"0011-07-16"})

  Vendor.create({"active"=>true, "address"=>"469 LYONS AVE. NEWARK, NJ 07112", "auto"=>nil, "category_type"=>"OIL DELIVERY", "cellphone"=>nil, "contact"=>"LAUREN", "email"=>"CPCENERGYINC@GMAIL.COM", "fax"=>"973-923-0359", "id"=>96, "independent_contractor_agreement"=>"YES", "liability"=>"0001-01-17", "name"=>"CPC ENERGY/ALLIANCE OIL", "phone"=>"973-923-3360", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"2600 ROUTE 130 NORTH BRUNSWICK, NJ 08902", "auto"=>nil, "category_type"=>"OIL DELIVERY", "cellphone"=>nil, "contact"=>"DAVID OR LINDA", "email"=>"JENNIFER@RASTALLOIL.COM…OR MICHELLE@RASTALLOIL.COM", "fax"=>"732-297-4508", "id"=>97, "independent_contractor_agreement"=>"YES", "liability"=>"0006-01-17", "name"=>"K.W. RASTALL OIL", "phone"=>"732-297-5600", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"36 EASTWOOD AVENUE DEER PARK, NY 11729", "auto"=>nil, "category_type"=>"PAINTING", "cellphone"=>nil, "contact"=>"ROBERT", "email"=>"RMG0712@YAHOO.COM", "fax"=>nil, "id"=>98, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"BAUMGARTNER PAINTING", "phone"=>"631-872-4026", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"65 SUYDAM LANE BAYPORT, NY 11705", "auto"=>nil, "category_type"=>"PLUMBING & ELECTRIC", "cellphone"=>nil, "contact"=>"STEVEN", "email"=>"SDKELECTRIC@GMAIL.COM", "fax"=>nil, "id"=>99, "independent_contractor_agreement"=>"YES", "liability"=>"0004-08-17", "name"=>"KILMEADE CONTRACTING d/b/a SDK ", "phone"=>"516-286-8290", "pollution"=>nil, "w9"=>"YES", "wc"=>"0009-05-17"})

  Vendor.create({"active"=>true, "address"=>"12 BRIAR HILLS CIRCLE SPRINGFIELD, NJ 07081", "auto"=>nil, "category_type"=>"PLUMBING & HEATING", "cellphone"=>"844-217-2115", "contact"=>"LAUREN", "email"=>"A.ALLIANCEPLUMBING@GMAIL.COM", "fax"=>"973-923-0359", "id"=>100, "independent_contractor_agreement"=>"YES", "liability"=>"0001-07-17", "name"=>"A1 ALLIANCE PLUMBING & HEATING", "phone"=>"908-868-8296", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-07-17"})

  Vendor.create({"active"=>true, "address"=>"11 DEEPWELLS LANE ST. JAMES, NY 11780", "auto"=>"0004-04-17", "category_type"=>"PLUMBING & HEATING", "cellphone"=>nil, "contact"=>"ED", "email"=>nil, "fax"=>"631-366-4626", "id"=>101, "independent_contractor_agreement"=>"YES", "liability"=>"0010-04-17", "name"=>"BRANCH PLUMBING & HEATING INC.", "phone"=>"631-584-7339", "pollution"=>nil, "w9"=>"YES", "wc"=>"0002-05-17"})

  Vendor.create({"active"=>true, "address"=>"22 KAREN DRIVE SAYVILLE, NY 11782", "auto"=>nil, "category_type"=>"PLUMBING & HEATING", "cellphone"=>"631-786-7975-Lou/567-2222-Dave", "contact"=>"LOU", "email"=>"GREEKPLUM@ME.COM", "fax"=>"631-244-6863", "id"=>102, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"CHARGE-IT PLUMBING & HEATING", "phone"=>"631-589-1726", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"31-99 123RD STREET FLUSHING, NY 11354", "auto"=>nil, "category_type"=>"PLUMBING & HEATING", "cellphone"=>nil, "contact"=>nil, "email"=>"LCORREA@VARSITYPLUMBING.COM", "fax"=>"718-358-5103", "id"=>103, "independent_contractor_agreement"=>"YES", "liability"=>"0005-01-17", "name"=>"VARSITY PLUMBING & HEATING", "phone"=>"718-358-5400", "pollution"=>nil, "w9"=>"YES", "wc"=>"0005-01-17"})

  Vendor.create({"active"=>true, "address"=>"304 CROSS BAY BLVD. BROAD CHANNEL, NY 11693", "auto"=>nil, "category_type"=>"PORTABLE TOILETS", "cellphone"=>nil, "contact"=>nil, "email"=>"INFO@CALLAHEAD.COM", "fax"=>"800-634-8127", "id"=>104, "independent_contractor_agreement"=>"YES", "liability"=>"0009-10-17", "name"=>"CALL-A-HEAD", "phone"=>"800-634-2085", "pollution"=>nil, "w9"=>"YES", "wc"=>"0005-01-17"})

  Vendor.create({"active"=>true, "address"=>"200 SMITH STREET KEASBY, NJ 08832", "auto"=>nil, "category_type"=>"PORTABLE TOILETS", "cellphone"=>nil, "contact"=>"JIM", "email"=>"JPRATT@RUSSELLREID.COM", "fax"=>"732-417-0367", "id"=>105, "independent_contractor_agreement"=>"YES", "liability"=>"0004-01-17", "name"=>"RUSSELL REID d/b/a MR. JOHN PORTABLE SANITATION", "phone"=>"732-692-2434", "pollution"=>nil, "w9"=>"YES", "wc"=>"0004-01-17"})

  Vendor.create({"active"=>true, "address"=>"31 HAGERMAN AVENUE MEDFORD, NY 11763", "auto"=>nil, "category_type"=>"POWER WASHING", "cellphone"=>"ALT # 631-885-1116", "contact"=>"(SMILEY) MIKE", "email"=>"ALLPERFECTIONPW@GMAIL.COM", "fax"=>nil, "id"=>106, "independent_contractor_agreement"=>"YES", "liability"=>"0009-02-17", "name"=>"ALL PERFECTION POWER WASHING", "phone"=>"631-320-3939", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"51 NESCONSET HIGHWAY PORT JEFFERSON, NY 11776", "auto"=>nil, "category_type"=>"ROOFING", "cellphone"=>"516-241-9612", "contact"=>"JOHN", "email"=>"MARIA@A1ROOFINGANDSIDINGOFLI.COM", "fax"=>"631-928-3222", "id"=>107, "independent_contractor_agreement"=>"YES", "liability"=>nil, "name"=>"A-1 ROOFING & SIDING OF LONG ISLAND CORP.", "phone"=>"631-928-1826", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"5585 RIO VISTA DRIVE CLEARWATER, FL 33760", "auto"=>nil, "category_type"=>"SELF STORAGE", "cellphone"=>"N/A", "contact"=>"CORPORATE DEVELOPMENT", "email"=>nil, "fax"=>"727-531-0525", "id"=>108, "independent_contractor_agreement"=>"NO/REFUSED TO SIGN", "liability"=>"0010-01-17", "name"=>"PODS                                                              CUSTOMER ID # 18815478 PIN # 1009", "phone"=>"888-776-7637", "pollution"=>nil, "w9"=>"YES", "wc"=>"0010-01-17"})

  Vendor.create({"active"=>true, "address"=>"50 COMMERCE DRIVE CUTCHOGUE, NY 11935", "auto"=>nil, "category_type"=>"SELF STORAGE", "cellphone"=>nil, "contact"=>"TOM", "email"=>"SALES@UNIT2GO.COM", "fax"=>"631-734-2178", "id"=>109, "independent_contractor_agreement"=>"YES", "liability"=>"0002-06-17", "name"=>"UNIT 2 GO", "phone"=>"631-734-2166", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"156 HINSDALE ST. BROOKLYN, NY 11207", "auto"=>nil, "category_type"=>"STORAGE", "cellphone"=>"646-591-1606", "contact"=>"MATT SCHWARTZBERG", "email"=>"MATT@A1FIRSTCLASS.COM", "fax"=>nil, "id"=>110, "independent_contractor_agreement"=>"YES", "liability"=>"0002-01-17", "name"=>"A-1 VIKING FIRST CLASS MOVING & STORAGE, INC", "phone"=>"718-745-3400", "pollution"=>nil, "w9"=>"YES", "wc"=>"0010-01-17"})

  Vendor.create({"active"=>true, "address"=>"90 EAST HALSEY ROAD  SUITE 103 PARSIPPANY, NJ 07054", "auto"=>nil, "category_type"=>"STORAGE", "cellphone"=>"732-800-1157", "contact"=>"BRIAN", "email"=>"BRIANCARTON@JDCARTON.COM", "fax"=>"973-386-1694", "id"=>111, "independent_contractor_agreement"=>"YES", "liability"=>"0006-04-17", "name"=>"J.D. CARTON & SON, INC.", "phone"=>"973-781-1600 X108", "pollution"=>nil, "w9"=>"YES", "wc"=>nil})

  Vendor.create({"active"=>true, "address"=>"8 NICHOLAS COURT UNIT A DAYTON, NJ 08810", "auto"=>nil, "category_type"=>"STORAGE", "cellphone"=>nil, "contact"=>nil, "email"=>nil, "fax"=>"609-409-8140", "id"=>112, "independent_contractor_agreement"=>"NO/REFUSED TO SIGN", "liability"=>"0001-01-17", "name"=>"PACK RAT", "phone"=>"800-PACK-RAT", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-01-17"})

  Vendor.create({"active"=>true, "address"=>"45 LEXINGTON AVENUE PATCHOGUE, NY 11772", "auto"=>nil, "category_type"=>"TREE/BRANCH REMOVAL", "cellphone"=>"631-291-7010", "contact"=>"DAVID", "email"=>"D.CION@YAHOO.COM", "fax"=>nil, "id"=>113, "independent_contractor_agreement"=>"YES", "liability"=>"0001-11-17", "name"=>"LONG ISLAND LUMBERJACK OF NEW YORK INC.", "phone"=>"631-244-9098", "pollution"=>nil, "w9"=>"YES", "wc"=>"0001-11-17"})
  ActiveRecord::Base.connection.reset_pk_sequence!('vendors')

  TrackerTask.create({"id"=>1, "name"=>"Job Created"})

  TrackerTask.create({"id"=>2, "name"=>"Manager Assigned"})

  TrackerTask.create({"id"=>3, "name"=>"Estimate Created"})

  TrackerTask.create({"id"=>4, "name"=>"Estimate Sent"})

  TrackerTask.create({"id"=>5, "name"=>"Contract Created"})

  TrackerTask.create({"id"=>6, "name"=>"Contract Sent"})

  TrackerTask.create({"id"=>7, "name"=>"Note Created"})

  TrackerTask.create({"id"=>8, "name"=>"File Uploaded"})

  TrackerTask.create({"id"=>9, "name"=>"Call Assigned"})

  TrackerTask.create({"id"=>10, "name"=>"Inspection Checklist Created"})

  TrackerTask.create({"id"=>11, "name"=>"Scheduler Created"})

  TrackerTask.create({"id"=>12, "name"=>"Pricing Created"})
  ActiveRecord::Base.connection.reset_pk_sequence!('tracker_tasks')

  VendorUploadType.create({"id"=>1, "name"=>"W9"})

  VendorUploadType.create({"id"=>2, "name"=>"W9"})

  VendorUploadType.create({"id"=>3, "name"=>"W9"})

  VendorUploadType.create({"id"=>4, "name"=>"W9"})
  ActiveRecord::Base.connection.reset_pk_sequence!('vendor_upload_types')

  AdminUser.create({"current_sign_in_at"=>nil, "current_sign_in_ip"=>nil, "email"=>"admin@example.com", "encrypted_password"=>"$2a$11$V.MoXIvAAqxeisws/5n0QeHmSQ7gO4XE.5Gd8vgih3iQNk1YfU9Ya", "id"=>1, "last_sign_in_at"=>nil, "last_sign_in_ip"=>nil, "remember_created_at"=>nil, "reset_password_sent_at"=>nil, "reset_password_token"=>nil, "sign_in_count"=>0})
  ActiveRecord::Base.connection.reset_pk_sequence!('admin_users')

  PricingCategory.create({"id"=>1, "name"=>"Initial Estimate"})

  PricingCategory.create({"id"=>2, "name"=>"Revised Estimate"})

  PricingCategory.create({"id"=>3, "name"=>"Final Estimate"})
  ActiveRecord::Base.connection.reset_pk_sequence!('pricing_categories')
end

SeedMigration::Migrator.bootstrap(20170823144703)
