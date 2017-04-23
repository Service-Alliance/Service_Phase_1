class Customer < ActiveRecord::Base
  has_many :phones, as: :phoneable
  belongs_to :address
  # validates :email, presence: true, format: {
  # with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i,
  # message: 'Invalid email format.'
  # }
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:first_name], parent.table[:last_name])
  end

  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end

  def cell_phones
    phones = []
    self.phones.each do |phone|
      if phone.type.name == "Cell"
        phones << phone
      end
    end
    return phones
  end

  def home_phones
    phones = []
    self.phones.each do |phone|
      if phone.type.name == "Home"
        phones << phone
      end
    end
    return phones
  end

  def fax_numbers
    phones = []
    self.phones.each do |phone|
      if phone.type.name == "Fax"
        phones << phone
      end
    end
    return phones
  end

  def work_numbers
    phones = []
    self.phones.each do |phone|
      if phone.type.name == "Work"
        phones << phone
      end
    end
    return phones
  end


end
