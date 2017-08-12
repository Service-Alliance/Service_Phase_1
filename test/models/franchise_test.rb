# == Schema Information
#
# Table name: franchises
#
#  id                       :integer          not null, primary key
#  name                     :string
#  franchise_number         :integer
#  legal_name               :string
#  phone                    :string
#  fax                      :string
#  website                  :string
#  address_id               :integer
#  general_license          :string
#  residential_license      :string
#  commercial_license       :string
#  mold_remediation_license :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

require 'test_helper'

class FranchiseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
