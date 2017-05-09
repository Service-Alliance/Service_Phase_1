class Address < ActiveRecord::Base
  belongs_to :state

  # ransacker :full_address do |parent|
  # Arel::Nodes::InfixOperation.new('||',
  #   parent.table[:address_1], parent.table[:address_2], parent.table[:city], parent.table[:zip_code], parent.table[:county])
  # end

end
