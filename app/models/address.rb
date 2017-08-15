class Address < ActiveRecord::Base
  belongs_to :state

  delegate :name, to: :state, allow_nil: true, prefix: true

  # ransacker :full_address do |parent|
  # Arel::Nodes::InfixOperation.new('||',
  #   parent.table[:address_1], parent.table[:address_2], parent.table[:city], parent.table[:zip_code], parent.table[:county])
  # end

  def full_address
    [address_1, address_2, city, state_name, zip_code, county].delete_if(&:blank?).join(' ')
  end

end
