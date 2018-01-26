class ContactsController < ApplicationController

before_action:set_contact, only:[:show, :edit, :update, :destroy, :create_call]


# GET / contacts# GET / contacts.json
def index 
  @search = Contact.where.not(first_name:nil).order('created_at DESC').search(params[:q])
  # @jobs = @search.result 
  @contacts = @search.result.page(params[:page]).order('created_at DESC') 
  @all_results = @search.result
end

# GET / contacts / 1# GET / contacts / 1. json
def show 
  @job = Job.find_by(id:params[:job_id]) 
  @note = @contact.notes.new 
  @uploads = @contact.uploads.build
end

# GET / contacts / new
def new 
  @contact = Contact.new 
  @address = Address.new 
  @job = Job.find_by(id:params[:job_id]) 
  @contact_address = Address.new 
  @phones = nil 
  @contact_companies = @contact.contact_companies.build
end

# GET / contacts / 1 / edit
def edit 
  @job = Job.find_by(id:params[:job_id]) 
  @address = Address.find_by(id:contact.address_id) || address = Address.new 
  @phones = contact.phones

end

# POST / contacts# POST / contacts.json
def create 
  @contact = Contact.new(contact_params) 
  @job = Job.find_by(id:job_param[:job_id])

respond_to do |format |
    if @contact.save
    if @job 
      @job.contact_id = @contact.id
if @job.save 
  @contact.phones.destroy_all
    phone_count = phone_params["type_ids"].count

phone_count.times do |index |
        unless phone_params["numbers"][index] == ""
         @contact.phones.create(type_id:phone_params["type_ids"][index], number:phone_params["numbers"][index], extension:phone_params["extensions"][index])
        end
       end
redirect_to @contact_path, notice:'Contact was successfully created.'
return
else
    render:new
return
end
else 
  @contact.phones.destroy_all
phone_count = phone_params["type_ids"].try(:count) || 0

phone_count.times do |index |
        unless phone_params["numbers"][index] == ""
@contact.phones.create(type_id:phone_params["type_ids"][index], number:phone_params["numbers"][index], extension:phone_params["extensions"][index])
end
end
redirect_to contact_path(@contact), notice:'Contact was successfully created.'
return
end
format.html { redirect_to @contact, notice:'Contact was successfully created.' }
format.json { render :show, status: :created, location: @contact } 
else
    format.html { render :new }
    format.json { render json: @contact.errors, status: :unprocessable_entity }
end
end
end

# PATCH / PUT / contacts / 1# PATCH / PUT / contacts / 1. json
def update
respond_to do |format |
    if job_param[:job_id] 
      @job = Job.find_by(id:job_param[:job_id])
if @address = Address.find_by(id: @contact.address_id)
  if @address.update(address_params)
end
else 
  @address = Address.new(address_params) 
  @address.save
  @contact.address_id = @address.id

unless contact_exists_params['contact_id'] == "0" || contact_exists_params.empty?
  @contact = Contact.find(contact_exists_params['contact_id'])
unless company_params.empty?
    unless company_params[:company_name] == ""
     @company = Company.create!(name:company_params[:company_name])
     ContactCompany.create(contact_id: @contact.id, company_id: @company.id)
end

if @contact.update(contact_params) 
  @contact.add_owner_as_subscriber
unless phone_params.empty? 
  @contact.phones.destroy_all
  phone_count = phone_params["type_ids"].count

  phone_count.times do |index |
        unless phone_params["numbers"][index] == ""
  @contact.phones.create(type_id:phone_params["type_ids"][index], number:phone_params["numbers"][index], extension:phone_params["extensions"][index])
end
end
end
if contact_params[:notes_attributes] 
  @note = @contact.notes.last 
  @contact.track 'Note Created', current_user, @note
end
if contact_params[:uploads_attributes] 
  @upload = @contact.uploads.last 
  @contact.track 'File Uploaded', current_user, upload
end

format.html {
    unless job_param.empty?
        return redirect_to job_path(@job), notice:'Contact was successfully updated.'
    else
        return redirect_to contact_path(@contact), notice:'Contact was successfully updated.'
    end
  }
format.json { render :show, status: :ok, location: @contact } 
else
    format.html { render :edit }
    format.json {render json: @contact.errors, status: :unprocessable_entity }
  end
end
end

# DELETE / contacts / 1# DELETE / contacts / 1. json
def destroy 
  @contact.destroy 
  @contact.phones.destroy_all
  respond_to do |format |
    format.html { redirect_to contacts_url, notice:'Contact was successfully destroyed.' }
    format.json { head :no_content }
  end
end

def samecaller job = 
  @Job.find_by(id:params[:job_id]) 
  @caller = Caller.find_by(job_id:job.id) 
  @caller_phones = caller.phones

  @caller_address = Address.find_by(id:caller.address_id)

 @address = Address.new(address_1:caller_address.address_1, address_2:caller_address.address_2, zip_code:caller_address.zip_code, city:caller_address.city, county:caller_address.county, state_id:caller_address.state_id)
 @address.save

 @contact = Contact.new(first_name:caller.first_name, last_name:caller.last_name, email:caller.email, address_id:address.id) 
 @contact.save

 @job.contact_id = @contact.id

 @caller_phones.each do |phone | 
  @caller.phones.create(number:phone.number, extension:phone.extension, type_id:phone.type_id)
end

@job.save
redirect_to contact_path(@contact, job_id: @job.id), notice:'Contact was successfully replicated from caller.'
end

def create_call# FIXME:this is almost exact copy of jobs_controller# create_call 
  @call = Call.find(call_params[:call_id]) 
  @call.contact_id = @contact.id 
  @contact.track 'Call Assigned', current_user, @call 
  @call.save
  redirect_to @contact
end

def send_to_sharpspring 
  @contact = Contact.find(params[:Contact_id]) 
  @job = Job.find(params[:job_id]) 
  @contact.send_to_sharpspring(job.franchise)
  redirect_to @job
end

def search_suggestions 
  @contacts = Contact.search_suggestions(params[:term])
  p render json: @contacts, include:[:address, :phones]
end



private# Use callbacks to share common setup or constraints between actions.
def set_contact 
  @contact = Contact.find(params[:id])
end

def call_params
params.fetch(:call, {}).permit(:d, :call_id)
end

def job_param
params.fetch(:job, {}).permit(:job_id)
end
def contact_exists_params
params.fetch(:contact_exists, {}).permit(:contact_id)
end

def address_params
params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
end
def company_params
params.fetch(:company, {}).permit(:company_name)
end

def phone_params
params.fetch(:phones, {}).permit(numbers:[], extensions:[], type_ids:[])
end

# Never trust parameters from the scary internet, only allow the white list through.
def contact_params
params.require(:contact).permit(:id, 
                                :first_name, 
                                :last_name, 
                                :email, 
                                :title, 
                                :website, 
                                :address_id, 
                                :category, 
                                :sub_category, 
                                :sharpspring_id, 
                                :job_id, 
                                :owner_id, 
                                :company_name,
                                uploads_attributes:[
                                         :id,
                                         :upload_category_id,
                                         :description,
                                         { uploads:[] }
                                       ],
                                notes_attributes:[:id, :content],
                                contact_companies_attributes:[:id, :company_id],
                                contact_vendors_attributes:[:id, :vendor_id],
                                phones_attributes:[
                                         :id,
                                         :type_id,
                                         :number,
                                         :extension,
                                         :_destroy
                                       ],
                                address_attributes:[
                                         :id,
                                         :address_1,
                                         :address_2,
                                         :zip_code,
                                         :city,
                                         :state_id,
                                         :county
                                       ]
                                     )
end
end