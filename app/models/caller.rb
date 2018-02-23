class Caller < ActiveRecord::Base
  belongs_to :job
  belongs_to :address
  has_many :phones, as: :phoneable
  has_many :caller_companies, dependent: :destroy
  has_many :companies, through: :caller_companies
  
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  include PgSearch
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
    parent.table[:first_name], parent.table[:last_name])
  end

  delegate :full_address, :address_without_county, :format_address, to: :address, allow_nil: true

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

  # FIXME: move all of these into a concern
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

  def first_phone_number
    phones.first.try(:number)
  end

  def company 
    companies.first
  end

  def company_name
    companies.count == 1 ? companies.first.name : ''
  end

  def add_company(company)
    return if company.nil?
    companies << company unless companies.include?(company)
  end
end
