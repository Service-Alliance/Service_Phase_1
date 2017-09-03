class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address
  belongs_to :company, required: false
  has_many :phones, as: :phoneable

  delegate :name, to: :company, allow_nil: true, prefix: true

  include PgSearch
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:first_name], parent.table[:last_name])
  end

  pg_search_scope :full_search,
  against: [:first_name, :last_name],
  associated_against: {
    :address => [:address_1, :address_2, :city],
    :phones => [:number]
  },
  using: {
    tsearch: {dictionary: 'english'}
  }

  def self.search_suggestions(param)
    results = full_search(param)
    return results.limit(10)
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

  def company_name=(value)
    return if company.present?
    self.company = Company.find_by(name: value)
  end
end
