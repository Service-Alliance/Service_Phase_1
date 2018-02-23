class Adjuster < ActiveRecord::Base
  belongs_to :address
  belongs_to :insurance_company
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  delegate :format_address, to: :address, allow_nil: true
  delegate :name, to: :insurance_company, allow_nil: true, prefix: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  def full_name
    first = first_name || " "
    last = last_name || " "
    return "#{first+ " " + last}"
  end

  def first_phone_number
    phones.first.try(:number)
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
