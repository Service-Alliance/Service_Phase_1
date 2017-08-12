# == Schema Information
#
# Table name: vendors
#
#  id                               :integer          not null, primary key
#  category_type                    :string
#  name                             :string
#  contact                          :string
#  phone                            :string
#  cellphone                        :string
#  fax                              :string
#  address                          :string
#  wc                               :date
#  liability                        :date
#  pollution                        :date
#  auto                             :date
#  w9                               :string
#  independent_contractor_agreement :string
#  email                            :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  active                           :boolean          default(TRUE)
#

require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
