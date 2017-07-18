# == Schema Information
#
# Table name: calls
#
#  id                    :integer          not null, primary key
#  callrail_id           :string
#  callsource            :string
#  datetime              :date
#  trackingnum           :string
#  customer_phone_number :string
#  destinationnum        :string
#  customer_name         :string
#  customer_city         :string
#  customer_state        :string
#  customer_zip          :string
#  customer_country      :string
#  keywords              :string
#  referrer              :string
#  referrermedium        :string
#  landingpage           :string
#  last_requested_url    :string
#  gclid                 :string
#  ip                    :string
#  utm_source            :string
#  utm_medium            :string
#  utm_term              :string
#  utm_content           :string
#  utm_campaign          :string
#  utma                  :string
#  utmb                  :string
#  utmv                  :string
#  utmz                  :string
#  utmx                  :string
#  ga                    :string
#  first_call            :string
#  recording             :string
#  duration              :integer
#  answered              :boolean
#  user_id               :integer
#  job_id                :integer
#  inprogress            :boolean
#  franchise_id          :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  transcription         :text
#  vendor_id             :integer
#  customer_id           :integer
#

require 'test_helper'

class CallTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
