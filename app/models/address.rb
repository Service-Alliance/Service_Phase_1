# == Schema Information
#
# Table name: addresses
#
#  id              :integer          not null, primary key
#  address_1       :string
#  address_2       :string
#  zip_code        :string
#  city            :string
#  county          :string
#  state_id        :integer
#  address_type_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Address < ActiveRecord::Base
  belongs_to :state

  # ransacker :full_address do |parent|
  # Arel::Nodes::InfixOperation.new('||',
  #   parent.table[:address_1], parent.table[:address_2], parent.table[:city], parent.table[:zip_code], parent.table[:county])
  # end

end
