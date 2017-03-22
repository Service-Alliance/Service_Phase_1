class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:first_name], parent.table[:last_name])
  end

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end

end
