# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  role_id                :integer          default(0)
#  notes                  :string
#  department_id          :integer
#  title                  :string
#  additional_title       :string
#  location_id            :integer
#  background_check       :date
#  online_physical        :date
#  fitness_test           :date
#  hep_b                  :string
#  lead                   :boolean
#  lead_expiration        :date
#  nys_mold               :string
#  nys_mold_expiration    :date
#  nys_mold_license       :string
#  bio_rec_bbp            :string
#  hartford               :date
#  pet_water              :date
#  pet_fire               :date
#  osha                   :string
#  iicrc_reg              :string
#  iicrc_expiration       :date
#  cec_due                :date
#  number_cec_due         :integer
#  iicrc_wrt              :string
#  iicrc_amrt             :string
#  iicrc_asd              :string
#  iicrc_srt              :string
#  iicrc_hst              :string
#  iicrc_uft              :string
#  iicrc_odor             :string
#  iicrc_cds              :string
#  sub_1                  :date
#  sub_2                  :date
#  dry_book               :string
#  login_count            :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
