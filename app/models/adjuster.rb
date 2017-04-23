class Adjuster < ActiveRecord::Base
  belongs_to :address
  belongs_to :insurance_company
  has_many :phones, as: :phoneable
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

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
