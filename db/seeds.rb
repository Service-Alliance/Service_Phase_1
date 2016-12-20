# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
JobStatus.create(name: "Active")
JobStatus.create(name: "Cancelled")
JobStatus.create(name: "Drybook")
JobStatus.create(name: "Complete")
JobStatus.create(name: "Job Complete")

JobType.create(name: "General Cleaning")
Franchise.create(name: "Chicago")
Franchise.create(name: "Tampa")
Franchise.create(name: "New York")

ReferralType.create(name: "Ad/TV")
ReferralType.create(name: "Friend")
ReferralType.create(name: "Other")
