user = User.create(email: 'callrep@test.com', password: 'password', password_confirmation: 'password', role_id: 3, first_name: 'Call', last_name: 'Rep', department_id: 1)
user = User.create(email: 'jobcoordinator@test.com', first_name: 'User', last_name: 'Two', password: 'password', password_confirmation: 'password', role_id: 2)
user = User.create(email: 'admin@test.com', first_name: 'User', last_name: 'Three', password: 'password', password_confirmation: 'password', role_id: 1)

user = User.create(email: 'creaumond@gmail.com', password: 'password', password_confirmation: 'password', role_id: 1, first_name: 'Connor', last_name: 'Reaumond', department_id: 1)


Role.create(name: "Admin")
Role.create(name: "Job Coordinator")
Role.create(name: "Call Rep")
Role.create(name: 'Project Manager')
Role.create(name: 'Crew Chief')
Role.create(name: 'Technician')

csv_text = File.read("db/files/users.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  user = User.new(row.to_hash)
  user.password = 'password'
  user.password_confirmation = 'password'
  user.save
end




Address.create(address_1: 'Address 1', address_2: 'Address 2')
Agent.create(first_name: 'Jake', last_name: 'Cinninger', insurance_company_id: 1, email: 'jcinninger@gmail.com', address_id: 1)
Adjuster.create(first_name: 'Brendan', last_name: 'Bayliss', insurance_company_id: 1, email: 'jcinninger@gmail.com', address_id: 1)

# Departments
Department.create(name: 'Administrative')
Department.create(name: 'Accounting')
Department.create(name: 'Consultant')
Department.create(name: 'Collections')
Department.create(name: 'Construction')
Department.create(name: 'Operations')
Department.create(name: 'Marketing')
Department.create(name: 'Marketing & Operations')

# Locations
Location.create(name: "Medford Office")
Location.create(name: "Field New York")
Location.create(name: "Field Queens")
Location.create(name: "Field New Jersey")
Location.create(name: "Field Medford")
Location.create(name: "Medford WH")
Location.create(name: "Queens WH")
Location.create(name: "Long Island WH")
Location.create(name: "New Jersey Office")
Location.create(name: "New Jersey")

Job.create(type_id: 1, status_id: 1, entered_by_id: 1, franchise_id: 1, details: 'This is a really good detail', job_note: 'This is an even better note.', customer_id: nil, referral_type_id: 1)

Caller.create(first_name: 'David Heinemeier', last_name: 'Hansson', email: 'dhh@test.com', address_id: 1, job_id: 1)

Phone.create(number: '911', type_id: 1)
Address.create(address_1: '123 Anywhere Ln', address_2: 'Suite 2017', zip_code: '60622', city: 'Chicago', state_id: '36', county: 'Cook County')

Call.create(inprogress: true, customer_phone_number: '+17703334444', customer_name: 'Olivia Rodriguez', customer_state: 'IL', customer_city: 'Chicago', customer_country: 'USA', customer_zip: '60622')

Call.create(inprogress: true, customer_phone_number: '+18473375371', customer_name: 'John Smith', customer_state: 'IL', customer_city: 'Lake Forest', customer_country: 'USA', customer_zip: '60045')

Call.create(inprogress: true, customer_phone_number: '+17703334444', customer_name: 'Olivia Rodriguez', customer_state: 'IL', customer_city: 'Chicago', customer_country: 'USA', customer_zip: '60622')

# Job Status
JobStatus.create(name: 'Pending')
JobStatus.create(name: 'Active')
invoiced = JobStatus.create(name: 'Invoiced')
JobStatus.create(name: 'Dead')

JobType.create(name: 'General Cleaning')

CorporateReferralType.create(name: "Xact Analysis")
CorporateReferralType.create(name: "Nexxus")
CorporateReferralType.create(name: "Contractor Connections")


# Franchise Names
Franchise.create(name: 'Central Manhattan')
Franchise.create(name: 'East Windsor')
medford_address = Address.create(address_1: "3090 Route 112", city: "Medford", state_id: 32, zip_code: "11763")
Franchise.create(name: 'Medford', franchise_number: 9584, legal_name: "Restoration Services of Medford, LLC", phone: "(631) 732-4931", website: 'http://www.servpromedfordny.com/', address_id: medford_address.id, general_license: "", residential_license: "", commercial_license: "", mold_remediation_license: "")
Franchise.create(name: 'Oakdale/North Bay Shore')
Franchise.create(name: 'Old Bridge/Cranbury')
Franchise.create(name: 'Southwest Brooklyn')

csv_text = File.read("db/files/central_zips.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  FranchiseZipcode.create!(row.to_hash)
end

csv_text = File.read("db/files/medford_zips.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  FranchiseZipcode.create!(row.to_hash)
end


csv_text = File.read("db/files/old_bridge_zips.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  FranchiseZipcode.create!(row.to_hash)
end


# Referral Types
ReferralType.create(name: 'Servpro Corporate')
ReferralType.create(name: 'Internet')
ReferralType.create(name: 'TV')
ReferralType.create(name: 'Yellowpages')
ReferralType.create(name: 'Other')
ReferralType.create(name: 'Refused')
ReferralType.create(name: 'IAC Dispatch')
ReferralType.create(name: 'Friend')
ReferralType.create(name: 'Insurance Adjuster')
ReferralType.create(name: 'Insurance Agent')
ReferralType.create(name: 'Neighbor')
ReferralType.create(name: 'Plumber')
ReferralType.create(name: 'Previous Customer')
ReferralType.create(name: 'Servpro Franchise')
ReferralType.create(name: 'Servpro Employee')
ReferralType.create(name: 'Vendor')
ReferralType.create(name: 'Property Manager')
ReferralType.create(name: 'Realtor')
ReferralType.create(name: 'Relative')

# Structure Types
residential = StructureType.create(name: 'Residential')
commercial = StructureType.create(name: 'Commercial')

# Commercial Property Types
PropertyType.create(name: 'Church', structure_type_id: commercial.id)
PropertyType.create(name: 'Factory', structure_type_id: commercial.id)
PropertyType.create(name: 'Historic', structure_type_id: commercial.id)
PropertyType.create(name: 'Office Building', structure_type_id: commercial.id)
PropertyType.create(name: 'Retail Space', structure_type_id: commercial.id)
PropertyType.create(name: 'School', structure_type_id: commercial.id)
PropertyType.create(name: 'Warehouse', structure_type_id: commercial.id)
# Residential Property Types
PropertyType.create(name: 'Apartment', structure_type_id: residential.id)
PropertyType.create(name: 'Condo', structure_type_id: residential.id)
PropertyType.create(name: 'Duplex', structure_type_id: residential.id)
PropertyType.create(name: 'High Rise', structure_type_id: residential.id)
PropertyType.create(name: 'House - Single', structure_type_id: residential.id)
PropertyType.create(name: 'Family', structure_type_id: residential.id)

# Affected Type
AffectedType.create(name: 'Yes')
AffectedType.create(name: 'No')
AffectedType.create(name: 'Unkown')

# Flooring Type
FlooringType.create(name: 'Carpet')
FlooringType.create(name: 'Concrete/Masonry')
FlooringType.create(name: 'Hardwood')
FlooringType.create(name: 'Other')
FlooringType.create(name: 'Tile')
FlooringType.create(name: 'Vinyl')

# Type of Loss
content_inventory = LossType.create(name: 'Content Inventory', tooltip: 'Tooltip about content inventory')
fire = LossType.create(name: 'Fire', tooltip: 'Tooltip about fires')
fire_water = LossType.create(name: 'Fire/Water', tooltip: 'Tooltip about fire & water')
general_cleaning = LossType.create(name: 'General Cleaning', tooltip: 'Tooltip about general cleaning')
liability = LossType.create(name: 'Liability', tooltip: 'Tooltip about liability')
mold = LossType.create(name: 'Mold', tooltip: 'Tooltip about mold')
odor = LossType.create(name: 'Odor', tooltip: 'Tooltip about odor')
sewage = LossType.create(name: 'Sewage', tooltip: 'Tooltip about sewage')
smoke = LossType.create(name: 'Smoke', tooltip: 'Tooltip about smoke')
vandalism = LossType.create(name: 'Vandalism', tooltip: 'Tooltip about vandalism')
water = LossType.create(name: 'Water', tooltip: 'Tooltip about water')
tree_removal = LossType.create(name: 'Tree Removal', tooltip: 'Tooltip about trees')
equipment = LossType.create(name: 'Equipment Rental', tooltip: 'Tooltip about rentals')

# Loss Causes
lc_fire = LossCause.create(name: 'Fire')
lc_other = LossCause.create(name: 'Other')
lc_sewage = LossCause.create(name: 'Sewage')
lc_smoke = LossCause.create(name: 'Smoke')
lc_water = LossCause.create(name: 'Water')
lc_candle = LossCause.create(name: 'Candle')
lc_dishwasher = LossCause.create(name: 'Dishwasher')
lc_electrical_malfunction = LossCause.create(name: 'Electrical Malfunction')
lc_grease = LossCause.create(name: 'Grease')
lc_lightning = LossCause.create(name: 'Lightning')
lc_other_appliance = LossCause.create(name: 'Other Appliance')
lc_puffback = LossCause.create(name: 'Puffback-Furnace')
lc_refrigerator = LossCause.create(name: 'Refrigerator')
lc_stove = LossCause.create(name: 'Stove/Oven')
lc_unknown = LossCause.create(name: 'Unknown')
lc_washing_machine = LossCause.create(name: 'Washing Machine')
lc_ac_leak = LossCause.create(name: 'AC Leak')
lc_water_heater = LossCause.create(name: 'Hot Water Heater')
lc_flood = LossCause.create(name: 'Flood')
lc_hurricane = LossCause.create(name: 'Hurricane')
lc_ice_storm = LossCause.create(name: 'Ice Storm')
lc_other_weather = LossCause.create(name: 'Other Weather')
lc_pipe = LossCause.create(name: 'Pipe')
lc_roof_leak = LossCause.create(name: 'Roof Leak')
lc_slab_leak = LossCause.create(name: 'Slab Leak')
lc_sump_pump = LossCause.create(name: 'Sump Pump Failure')
lc_toilet = LossCause.create(name: 'Toilet')
lc_tornado = LossCause.create(name: 'Tornado')
lc_wind = LossCause.create(name: 'Wind')
lc_animal = LossCause.create(name: 'Animal')
lc_mildew = LossCause.create(name: 'Mildew')
lc_sewage_back_up = LossCause.create(name: 'Sewage Back-Up')
lc_stain = LossCause.create(name: 'Stain on Carpet')
lc_blank = LossCause.create(name: '')

# Loss Cause by Type

# Content Inventory
LossCauseType.create(loss_type_id: content_inventory.id, loss_cause_id: lc_fire.id)
LossCauseType.create(loss_type_id: content_inventory.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: content_inventory.id, loss_cause_id: lc_sewage.id)
LossCauseType.create(loss_type_id: content_inventory.id, loss_cause_id: lc_smoke.id)
LossCauseType.create(loss_type_id: content_inventory.id, loss_cause_id: lc_water.id)

# Fire
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_candle.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_dishwasher.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_electrical_malfunction.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_grease.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_lightning.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_other_appliance.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_puffback.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_refrigerator.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_stove.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_unknown.id)
LossCauseType.create(loss_type_id: fire.id, loss_cause_id: lc_washing_machine.id)
# Fire/Water
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_candle.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_dishwasher.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_electrical_malfunction.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_grease.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_lightning.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_other_appliance.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_puffback.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_refrigerator.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_stove.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_unknown.id)
LossCauseType.create(loss_type_id: fire_water.id, loss_cause_id: lc_washing_machine.id)
# General Cleaning
LossCauseType.create(loss_type_id: general_cleaning.id, loss_cause_id: lc_other.id)
# Liability
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_ac_leak.id)
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_water_heater.id)
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_other_appliance.id)
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_refrigerator.id)
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_stove.id)
LossCauseType.create(loss_type_id: liability.id, loss_cause_id: lc_washing_machine.id)
# Mold
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_ac_leak.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_flood.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_water_heater.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_hurricane.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_ice_storm.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_mildew.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_other_weather.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_pipe.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_roof_leak.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_slab_leak.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_sump_pump.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_toilet.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_tornado.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_unknown.id)
LossCauseType.create(loss_type_id: mold.id, loss_cause_id: lc_wind.id)
# Odor
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_animal.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_electrical_malfunction.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_grease.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_mildew.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_sewage_back_up.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_stain.id)
LossCauseType.create(loss_type_id: odor.id, loss_cause_id: lc_unknown.id)
# Sewage
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_ac_leak.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_flood.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_water_heater.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_hurricane.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_ice_storm.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_mildew.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_slab_leak.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_sump_pump.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_toilet.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_tornado.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_unknown.id)
LossCauseType.create(loss_type_id: sewage.id, loss_cause_id: lc_wind.id)
# Smoke
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_candle.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_dishwasher.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_electrical_malfunction.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_grease.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_lightning.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_other_appliance.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_puffback.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_refrigerator.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_stove.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_unknown.id)
LossCauseType.create(loss_type_id: smoke.id, loss_cause_id: lc_washing_machine.id)
# Vandalism
LossCauseType.create(loss_type_id: vandalism.id, loss_cause_id: lc_blank.id)
# Water
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_ac_leak.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_flood.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_water_heater.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_hurricane.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_ice_storm.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_mildew.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_other.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_other_weather.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_pipe.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_roof_leak.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_slab_leak.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_sump_pump.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_toilet.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_tornado.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_unknown.id)
LossCauseType.create(loss_type_id: water.id, loss_cause_id: lc_wind.id)

# States
State.create(name: 'AL')
State.create(name: 'AK')
State.create(name: 'AZ')
State.create(name: 'AR')
State.create(name: 'CA')
State.create(name: 'CO')
State.create(name: 'CT')
State.create(name: 'DE')
State.create(name: 'FL')
State.create(name: 'GA')
State.create(name: 'HI')
State.create(name: 'ID')
State.create(name: 'IL')
State.create(name: 'IN')
State.create(name: 'IA')
State.create(name: 'KS')
State.create(name: 'KY')
State.create(name: 'LA')
State.create(name: 'ME')
State.create(name: 'MD')
State.create(name: 'MA')
State.create(name: 'MI')
State.create(name: 'MN')
State.create(name: 'MS')
State.create(name: 'MO')
State.create(name: 'MT')
State.create(name: 'NE')
State.create(name: 'NV')
State.create(name: 'NH')
State.create(name: 'NJ')
State.create(name: 'NM')
State.create(name: 'NY')
State.create(name: 'NC')
State.create(name: 'ND')
State.create(name: 'OH')
State.create(name: 'OK')
State.create(name: 'OR')
State.create(name: 'PA')
State.create(name: 'RI')
State.create(name: 'SC')
State.create(name: 'SD')
State.create(name: 'TN')
State.create(name: 'TX')
State.create(name: 'UT')
State.create(name: 'VT')
State.create(name: 'VA')
State.create(name: 'WA')
State.create(name: 'WV')
State.create(name: 'WI')
State.create(name: 'WY')

# Insurance Company Names
InsuranceCompany.create(name: 'AAA Missouri Insurance Company',
                        bulletin_number: '4056-SF', effective_date: Date.new(2012,3,22),
                        states_involved: 'U.S. Franchises in AL, AR, IL, IN, KS, LA, MO, and MS',
                        property_type: 'Residential', collect_deductible: 'Yes',
                        esl: 3000, estimating_software: 'Xactimate 27.5',
                        pricing: 'Use the most current price list provided by Xactimate for your area.',
                        customer_service_contacts: '1-800-222-7623',
                        special_conditions: 'Dispatches for AAA Missouri will appear as AAA Northern New England...  Use Xactimate Profile ACSC.')

InsuranceCompany.create(name: 'AAA of Carolina Group')
InsuranceCompany.create(name: 'AAA of Northern New England')
InsuranceCompany.create(name: 'AAA Southern California')
InsuranceCompany.create(name: 'Acadia Insurance Company')
InsuranceCompany.create(name: 'Acceptance Casualty Ins. Co. (subsidiary of Wellington Claim Service, Inc.)')
InsuranceCompany.create(name: 'ACE Private Risk Services (APRS) - Residential Water Mitigation')
InsuranceCompany.create(name: 'ACE Private Risk Services (APRS) - Residential Fire & Smoke Mitigation Program')

PhoneType.create(name: 'Cell')
PhoneType.create(name: 'Work')
PhoneType.create(name: 'Home')
PhoneType.create(name: 'Fax')



Form.create(package_id: "amUqRrobcTQo3uoRTIoVA7Y1M34=", transaction_id: "ad08384325cf474bf4c4075e63e38399aec3d93836c1030e", name: "Payment Authorization", signer_id: "e7901eca-87bb-4891-9f93-51a8e44258c4")

csv_text = File.read("db/files/vendor_list.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Vendor.create!(row.to_hash)
end

csv_text = File.read("db/files/insurance_list.csv")
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  InsuranceCompany.create(row.to_hash)
end
# csv_text = File.read("db/files/customer_seed.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   hash = row.to_hash
#
#   last_name = hash["last_name"]
#   first_name = hash["first_name"]
#   zip_code = hash["zip"]
#   number = hash["number"]
#   note = hash["notes"]
#   address_1 = hash["address_1"]
#   state = hash["state"]
#   recieved = hash["Received"]
#   scope = hash["Scope"]
#
#   loss_cause = LossCause.find_by(name: scope)
#   state_obj = State.find_by(name: state)
#
#   p address = Address.create(address_1: address_1, zip_code: zip_code, state_id: state_obj.try(:id))
#   p job = Job.create(status_id: invoiced.id, job_note: note)
#   caller = Caller.create(first_name: first_name, last_name: last_name, address_id: address.id, job_id: job.id)
#   p Loss.create(job_id: job.id, loss_cause_id: loss_cause.try(:id))
#
# end



# csv_text = File.read("db/files/dave_contacts.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   hash = row.to_hash
#   company = hash["company"]
#   email = hash["email"]
#   last_name = hash["last_name"]
#   first_name = hash["first_name"]
#   zip_code = hash["zip_code"]
#   state = hash["state_code"]
#   city = hash["city"]
#
#   state_obj = State.find_by(name: state)
#
#   address = Address.create(zip_code: zip_code, state_id: state_obj.try(:id), city: city)
#   Contact.create(first_name: first_name, last_name: last_name, company: company, email: email, address_id: address.id, owner_id: 29)
#
# end
#
#
# csv_text = File.read("db/files/donna_contacts.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   hash = row.to_hash
#   company = hash["company"]
#   email = hash["email"]
#   last_name = hash["last_name"]
#   first_name = hash["first_name"]
#   zip_code = hash["zip_code"]
#   address_1 = hash["address_1"]
#   address_2 = hash["address_2"]
#   state = hash["state_code"]
#   city = hash["city"]
#
#   state_obj = State.find_by(name: state)
#
#   address = Address.create(zip_code: zip_code, state_id: state_obj.try(:id), city: city, address_1: address_1, address_2: address_2)
#   Contact.create(first_name: first_name, last_name: last_name, company: company, email: email, address_id: address.id, owner_id: 25)
#
# end


TrackerTask.create(name: "Job Created")
TrackerTask.create(name: "Manager Assigned")
TrackerTask.create(name: "Estimate Created")
TrackerTask.create(name: "Estimate Sent")
TrackerTask.create(name: "Contract Created")
TrackerTask.create(name: "Contract Sent")
TrackerTask.create(name: "Note Created")
TrackerTask.create(name: "File Uploaded")
TrackerTask.create(name: "Call Assigned")
TrackerTask.create(name: "Inspection Checklist Created")
TrackerTask.create(name: "Scheduler Created")
TrackerTask.create(name: "Pricing Created")
VendorUploadType.create(name: "W9")
VendorUploadType.create(name: "W9")
VendorUploadType.create(name: "W9")
VendorUploadType.create(name: "W9")
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
