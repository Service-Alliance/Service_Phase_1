user = User.create(:email => 'callrep@test.com', :password => 'password', :password_confirmation => 'password', call_rep: true)
user = User.create(:email => 'jobcoordinator@test.com', :password => 'password', :password_confirmation => 'password', job_coordinator: true)
user = User.create(:email => 'admin@test.com', :password => 'password', :password_confirmation => 'password', admin: true)


# Employee Notes
# Name:
# Department:
# Title:
# Additional Title:
# Location:
# Email:
# Background Check: Date
# Online Physical: Date
# Fit Test: Date 
# Hep B:
# Lead:
# MOLD CERTIFICATIONS
# NYS Mold:
# NYS Mold Exp:
# NYS Mold License #:
 
# Bio-Rec/BBP
# Hartford
# Pet/Water
# Pet/Fire 
# OSHA
# IICRC REG #:
# CEC's Due:
# IICRC WRT:


# Department Names
# Administrative
# Accounting
# Consultant
# Collections
# Construction
# Operations
# Marketing





Job.create(type_id: 1, status_id: 1, entered_by_id: 1, franchise_id: 1, details: "This is a really good detail", notes: "This is an even better note.", customer_id: nil, referral_type_id: 1)

Caller.create(first_name: "David Heinemeier", last_name: "Hansson", email: "dhh@test.com", address_id: 1, job_id: 1)

Phone.create(number: "911", type_id: 1, caller_id: 1)
Address.create(address_1: "123 Anywhere Ln", address_2: "Suite 2017", zip_code: "60622", city: "Chicago", state_id: "36", county: "Cook County")

Call.create(inprogress: true, customer_phone_number: "+17703334444", customer_name: "Olivia Rodriguez", customer_state: "IL", customer_city: "Chicago", customer_country: "USA", customer_zip: "60622")

Call.create(inprogress: true, customer_phone_number: "+18473375371", customer_name: "John Smith", customer_state: "IL", customer_city: "Lake Forest", customer_country: "USA", customer_zip: "60045")

Call.create(inprogress: true, customer_phone_number: "+17703334444", customer_name: "Olivia Rodriguez", customer_state: "IL", customer_city: "Chicago", customer_country: "USA", customer_zip: "60622")


# Job Status
JobStatus.create(name: "Lead")
JobStatus.create(name: "Active")
JobStatus.create(name: "Invoiced")
JobStatus.create(name: "Dead")




JobType.create(name: "General Cleaning")

# Franchise Names
Franchise.create(name: "Central Manhattan")
Franchise.create(name: "East Windsor")
Franchise.create(name: "Medford")
Franchise.create(name: "Oakdale/North Bay Shore")
Franchise.create(name: "Old Bridge/Cranbury")
Franchise.create(name: "Southwest Brooklyn")

# Referral Types
ReferralType.create(name: "Servpro Corporate")
ReferralType.create(name: "Internet")
ReferralType.create(name: "TV")
ReferralType.create(name: "Yellowpages")
ReferralType.create(name: "Other")
ReferralType.create(name: "Refused")
ReferralType.create(name: "IAC Dispatch")
ReferralType.create(name: "Friend")
ReferralType.create(name: "Insurance Adjuster")
ReferralType.create(name: "Insurance Agent")
ReferralType.create(name: "Neighbor")
ReferralType.create(name: "Plumber")
ReferralType.create(name: "Previous Customer")
ReferralType.create(name: "Servpro Franchise")
ReferralType.create(name: "Sub-Contractor")
ReferralType.create(name: "Property Manager")
ReferralType.create(name: "Realtor")
ReferralType.create(name: "Relative")

# Structure Types
residential = StructureType.create(name: "Residential")
commercial = StructureType.create(name: "Commercial")

# Commercial Property Types
PropertyType.create(name: "Church", structure_type_id: commercial.id)
PropertyType.create(name: "Factory", structure_type_id: commercial.id)
PropertyType.create(name: "Historic", structure_type_id: commercial.id)
PropertyType.create(name: "Office Building", structure_type_id: commercial.id)
PropertyType.create(name: "Retail Space", structure_type_id: commercial.id)
PropertyType.create(name: "School", structure_type_id: commercial.id)
PropertyType.create(name: "Warehouse", structure_type_id: commercial.id)
# Residential Property Types
PropertyType.create(name: "Apartment", structure_type_id: residential.id)
PropertyType.create(name: "Condo", structure_type_id: residential.id)
PropertyType.create(name: "Duplex", structure_type_id: residential.id)
PropertyType.create(name: "High Rise", structure_type_id: residential.id)
PropertyType.create(name: "House - Single", structure_type_id: residential.id)
PropertyType.create(name: "Family", structure_type_id: residential.id)

# Affected Type
AffectedType.create(name: "Yes")
AffectedType.create(name: "No")
AffectedType.create(name: "Unkown")

# Flooring Type
FlooringType.create(name: "Carpet")
FlooringType.create(name: "Concrete/Masonry")
FlooringType.create(name: "Hardwood")
FlooringType.create(name: "Other")
FlooringType.create(name: "Tile")
FlooringType.create(name: "Vinyl")

# Type of Loss
content_inventory = LossType.create(name: "Content Inventory")
fire = LossType.create(name: "Fire")
fire_water = LossType.create(name: "Fire/Water")
general_cleaning = LossType.create(name: "General Cleaning")
liability = LossType.create(name: "Liability")
mold = LossType.create(name: "Mold")
odor = LossType.create(name: "Odor")
sewage = LossType.create(name: "Sewage")
smoke = LossType.create(name: "Smoke")
vandalism = LossType.create(name: "Vandalism")
water = LossType.create(name: "Water")
tree_removal = LossType.create(name "Tree Removal")

# Loss Causes
lc_fire = LossCause.create(name: "Fire")
lc_other = LossCause.create(name: "Other")
lc_sewage = LossCause.create(name: "Sewage")
lc_smoke = LossCause.create(name: "Smoke")
lc_water = LossCause.create(name: "Water")
lc_candle = LossCause.create(name: "Candle")
lc_dishwasher = LossCause.create(name: "Dishwasher")
lc_electrical_malfunction = LossCause.create(name: "Electrical Malfunction")
lc_grease = LossCause.create(name: "Grease")
lc_lightning = LossCause.create(name: "Lightning")
lc_other_appliance = LossCause.create(name: "Other Appliance")
lc_puffback = LossCause.create(name: "Puffback-Furnace")
lc_refrigerator = LossCause.create(name: "Refrigerator")
lc_stove = LossCause.create(name: "Stove/Oven")
lc_unknown = LossCause.create(name: "Unknown")
lc_washing_machine = LossCause.create(name: "Washing Machine")
lc_ac_leak = LossCause.create(name: "AC Leak")
lc_water_heater = LossCause.create(name: "Hot Water Heater")
lc_flood = LossCause.create(name: "Flood")
lc_hurricane = LossCause.create(name: "Hurricane")
lc_ice_storm = LossCause.create(name: "Ice Storm")
lc_other_weather = LossCause.create(name: "Other Weather")
lc_pipe = LossCause.create(name: "Pipe")
lc_roof_leak = LossCause.create(name: "Roof Leak")
lc_slab_leak = LossCause.create(name: "Slab Leak")
lc_sump_pump = LossCause.create(name: "Sump Pump Failure")
lc_toilet = LossCause.create(name: "Toilet")
lc_tornado = LossCause.create(name: "Tornado")
lc_wind = LossCause.create(name: "Wind")
lc_animal = LossCause.create(name: "Animal")
lc_mildew = LossCause.create(name: "Mildew")
lc_sewage_back_up = LossCause.create(name: "Sewage Back-Up")
lc_stain = LossCause.create(name: "Stain on Carpet")
lc_blank = LossCause.create(name: "")

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
State.create(name: "AL")
State.create(name: "AK")
State.create(name: "AZ")
State.create(name: "AR")
State.create(name: "CA")
State.create(name: "CO")
State.create(name: "CT")
State.create(name: "DE")
State.create(name: "FL")
State.create(name: "GA")
State.create(name: "HI")
State.create(name: "ID")
State.create(name: "IL")
State.create(name: "IN")
State.create(name: "IA")
State.create(name: "KS")
State.create(name: "KY")
State.create(name: "LA")
State.create(name: "ME")
State.create(name: "MD")
State.create(name: "MA")
State.create(name: "MI")
State.create(name: "MN")
State.create(name: "MS")
State.create(name: "MO")
State.create(name: "MT")
State.create(name: "NE")
State.create(name: "NV")
State.create(name: "NH")
State.create(name: "NJ")
State.create(name: "NM")
State.create(name: "NY")
State.create(name: "NC")
State.create(name: "ND")
State.create(name: "OH")
State.create(name: "OK")
State.create(name: "OR")
State.create(name: "PA")
State.create(name: "RI")
State.create(name: "SC")
State.create(name: "SD")
State.create(name: "TN")
State.create(name: "TX")
State.create(name: "UT")
State.create(name: "VT")
State.create(name: "VA")
State.create(name: "WA")
State.create(name: "WV")
State.create(name: "WI")
State.create(name: "WY")

# Insurance Company Names
InsuranceCompany.create(name: "AAA Missouri Insurance Company")
InsuranceCompany.create(name: "AAA of Carolina Group")
InsuranceCompany.create(name: "AAA of Northern New England")
InsuranceCompany.create(name: "AAA Southern California")
InsuranceCompany.create(name: "Acadia Insurance Company")
InsuranceCompany.create(name: "Acceptance Casualty Ins. Co. (subsidiary of Wellington Claim Service, Inc.)")
InsuranceCompany.create(name: "ACE Private Risk Services (APRS) - Residential Water Mitigation")
InsuranceCompany.create(name: "ACE Private Risk Services (APRS) - Residential Fire & Smoke Mitigation Program")

PhoneType.create(name: "Cell")
PhoneType.create(name: "Work")
PhoneType.create(name: "Home")
