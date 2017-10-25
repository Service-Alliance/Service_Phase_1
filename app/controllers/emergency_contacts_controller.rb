class EmergencyContactsController < ApplicationController
  before_action :set_emergency_contact, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /emergency_contacts
  # GET /emergency_contacts.json
  def index
    @emergency_contacts = EmergencyContact.all
  end

  # GET /emergency_contacts/1
  # GET /emergency_contacts/1.json
  def show
    @adddress = Address.find_by(id: @emergency_contact.id)
  end

  # GET /emergency_contacts/new
  def new
    @emergency_contact = EmergencyContact.new
    @address = Address.new
    @phones = nil
  end

  # GET /emergency_contacts/1/edit
  def edit
    @address = Address.find_by(id: @emergency_contact.address_id) || @address = Address.new
    @phones = @emergency_contact.phones
  end

  # POST /emergency_contacts
  # POST /emergency_contacts.json
  def create
    @emergency_contact = EmergencyContact.new(emergency_contact_params)
    @address = Address.new(address_params)

    respond_to do |format|
      @address.save
      @emergency_contact.address_id = @address.id
      @emergency_contact.job_id = @job.id
      if @emergency_contact.save

        @emergency_contact.phones.destroy_all
        phone_count = phone_params['type_ids'].try(:count) || 0

        phone_count.times do |index|
          unless phone_params['numbers'][index] == ''
            @emergency_contact.phones.create(type_id: phone_params['type_ids'][index], number: phone_params['numbers'][index], extension: phone_params['extensions'][index])
          end
        end

        format.html { redirect_to job_emergency_contact_path(@job, @emergency_contact), notice: 'Emergency contact was successfully created.' }
        format.json { render :show, status: :created, location: @emergency_contact }
      else
        format.html { render :new }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergency_contacts/1
  # PATCH/PUT /emergency_contacts/1.json
  def update
    respond_to do |format|
      @address = Address.find_by(id: @emergency_contact.address_id)
      @address.save if @address.update(address_params)
      if @emergency_contact.update(emergency_contact_params)
        @emergency_contact.phones.destroy_all
        phone_count = phone_params['type_ids'].try(:count) || 0

        phone_count.times do |index|
          unless phone_params['numbers'][index] == ''
            @emergency_contact.phones.create(type_id: phone_params['type_ids'][index], number: phone_params['numbers'][index], extension: phone_params['extensions'][index])
          end
        end

        format.html { redirect_to job_emergency_contact_path(@job, @emergency_contact), notice: 'Emergency contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency_contact }
      else
        format.html { render :edit }
        format.json { render json: @emergency_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_contacts/1
  # DELETE /emergency_contacts/1.json
  def destroy
    @emergency_contact.destroy
    @emergency_contact.phones.destroy_all
    respond_to do |format|
      format.html { redirect_to job_emergency_contacts_url(@job.id), notice: 'Emergency contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def samecaller
    @job = Job.find_by(id: params[:job_id])
    @caller = Caller.find_by(job_id: @job.id)
    @caller_phone = Phone.find_by(caller_id: @caller.id)

    @caller_address = Address.find_by(id: @caller.address_id)

    @address = Address.new(address_1: @caller_address.address_1, address_2: @caller_address.address_2, zip_code: @caller_address.zip_code, city: @caller_address.city, county: @caller_address.county, state_id: @caller_address.state_id)

    @address.save

    @emergency_contact = EmergencyContact.new(first_name: @caller.first_name, last_name: @caller.last_name, email: @caller.email, address_id: @address.id, job_id: @job.id)
    @emergency_contact.save

    @phone = Phone.new(number: @caller_phone.number, extension: @caller_phone.extension, emergency_contact_id: @emergency_contact.id, type_id: @caller_phone.type_id)
    @phone.save

    @job.save

    redirect_to job_path(@job), notice: 'Adjuster was successfully replicated from caller.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_emergency_contact
    @emergency_contact = EmergencyContact.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def emergency_contact_params
    params.require(:emergency_contact).permit(:job_id, :first_name, :last_name, :email, :address_id)
  end

  def address_params
    params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
  end

  def phone_params
    params.require(:phones).permit(numbers: [], extensions: [], type_ids: [])
  end
end
