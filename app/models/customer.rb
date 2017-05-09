class Customer < ActiveRecord::Base
  has_many :phones, as: :phoneable
  belongs_to :address
  has_many :notes, as: :noteable, dependent: :destroy
  has_many :trackers, as: :trackable, dependent: :destroy
  has_many :uploads, as: :uploadable, dependent: :destroy
  belongs_to :owner, class_name: "User"
  accepts_nested_attributes_for :uploads
  accepts_nested_attributes_for :notes
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

  def full_address
    address_1 = self.try(:address).try(:address_1) || " "
    address_2 = self.try(:address).try(:address_2) || " "
    city =  self.try(:address).try(:city) || " "
    state =  self.try(:address).try(:state).try(:name) || " "
    zip_code =  self.try(:address).try(:zip_code) || " "
    county =  self.try(:address).try(:county) || " "
    return "#{address_1 + " " + address_2 + " " + city + " " + state + " " + zip_code + " " + county}"
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

  def self.same_as_caller(job)
    @job = Job.find_by(id: job)
    @caller = Caller.find_by(job_id: @job.id)

    # check if old customer exists
    if @job.customer_id
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
      @caller.phones.create(number: phone.number, extension: phone.extension, type_id: phone.type_id)
    end

    @job.save
  end


end
