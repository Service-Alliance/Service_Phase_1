class Customer < ActiveRecord::Base
  has_many :phones, as: :phoneable
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  belongs_to :address
  accepts_nested_attributes_for :address
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  belongs_to :owner, class_name: "User"
  has_many :jobs
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
  has_many :customer_companies
  has_many :companies, through: :customer_companies
  accepts_nested_attributes_for :customer_companies
  has_many :customer_vendors
  has_many :vendors, through: :customer_vendors
  accepts_nested_attributes_for :customer_vendors

  delegate :full_address, :address_without_county, :format_address, to: :address, allow_nil: true

  include PgSearch
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }

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

  def first_phone_number
    phones.first.try(:number)
  end

  # FIXME: this should be move to Job model
  def self.same_as_caller(job)
    @job = Job.find_by(id: job)
    @caller = Caller.find_by(job_id: @job.id)

    # check if old customer exists
    if @job.customer_id
      # FIXME: it's not a good idea to destroy object from database. Maybe just inactive?
      Customer.find_by(id: @job.customer_id).destroy
    end

    @caller_phones = @caller.phones

    @caller_address = Address.find_by(id: @caller.address_id)

    @address = Address.new(address_1: @caller_address.address_1, address_2: @caller_address.address_2, zip_code: @caller_address.zip_code, city: @caller_address.city, county: @caller_address.county, state_id: @caller_address.state_id)

    @address.save

    @customer = Customer.new(first_name: @caller.first_name, last_name: @caller.last_name, email: @caller.email, address_id: @address.id)
    @customer.save

    @job.customer_id = @customer.id

    @caller_phones.each do |phone|
      @customer.phones.create(number: phone.number, extension: phone.extension, type_id: phone.type_id)
    end

    @job.save
  end

  def add_owner_as_subscriber
    if self.owner_id
    self.jobs.each do |job|
      Subscription.find_or_create_by(user_id: self.owner_id, job_id: job.id)
    end
  end
  end

  def send_to_sharpspring(franchise)
    p @json = {
      "method":"createLeads",
      "params":
        {"objects":
          [{"firstName": self.first_name,"lastName": self.last_name,"emailAddress": self.email, "companyName": self.company_name, "title": self.title, "website": self.website, "street": self.try(:address).try(:address_1), "city": self.try(:address).try(:city), "state": self.try(:address).try(:state).try(:name), "mobilePhoneNumber": self.try(:phones).where(type_id: 1).first.try(:number), "homePhoneNumber": self.try(:phones).where(type_id: 3).first.try(:number), "officePhoneNumber": self.try(:phones).where(type_id: 2).first.try(:number), "faxNumber": self.try(:phones).where(type_id: 4).first.try(:number)}]
        },
      "id":"1"
    }.to_json
    if franchise.name == "Central Manhattan"
      @accountId = ENV['CENTRAL_MANHATTAN_SHARPSPRING_ACCOUNT_ID']
      @secretKey = ENV['CENTRAL_MANHATTAN_SHARPSPRING_SECRET']
    elsif franchise.name == "East Windsor"
      @accountId = ENV['EAST_WINDSOR_SHARPSPRING_ACCOUNT_ID']
      @secretKey = ENV['EAST_WINDSOR_SHARPSPRING_SECRET']
    elsif franchise.name == "Medford"
      @accountId = ENV['MEDFORD_SHARPSPRING_ACCOUNT_ID']
      @secretKey = ENV['MEDFORD_SHARPSPRING_SECRET']
    elsif franchise.name == "Oakdale/North Bay Shore"
      @accountId = ENV['OAKDALE_SHARPSPRING_ACCOUNT_ID']
      @secretKey = ENV['OAKDALE_SHARPSPRING_SECRET']
    elsif franchise.name == "Old Bridge/Cranbury"
      @accountId = ENV['CRANBURY_SHARPSPRING_ACCOUNT_ID']
      @secretKey = ENV['CRANBURY_SHARPSPRING_SECRET']
    elsif franchise.name == "Southwest Brooklyn"
      @accountId = ENV['CRANBURY_SHARPSPRING_ACCOUNT_ID']
      @secretKey = ENV['CRANBURY_SHARPSPRING_SECRET']
    end
    response = HTTParty.post("https://api.sharpspring.com/pubapi/v1/?accountID=#{@accountId}&secretKey=#{@secretKey}", :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}, body: @json)
    self.sharp_spring_id = response.parsed_response['result']['creates'][0]['id']
    self.save
  end


end
