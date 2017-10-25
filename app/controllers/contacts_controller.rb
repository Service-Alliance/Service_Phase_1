class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @address = Address.new
    @job = Job.find_by(id: params[:job_id])
    @phones = nil
  end

  # GET /contacts/1/edit
  def edit
    @address = Address.find_by(id: @contact.address_id) || @address = Address.new
    @phones = @contact.phones
    @job = Job.find_by(id: params[:job_id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    p @address = Address.create(address_params)
    @job = Job.find_by(id: job_param[:job_id])
    p @contact.address_id = @address.id

    respond_to do |format|
      if @contact.save
        if @job
          @job.contact_id = @contact.id
          if @job.save

            @contact.phones.destroy_all
            phone_count = phone_params["type_ids"].count

            phone_count.times do |index|
              unless phone_params["numbers"][index] == ""
                @contact.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
              end
            end
            redirect_to job_path(@job), notice: 'Contact was successfully created.'
            return
          else
            render :new
            return
          end
        else

          @contact.phones.destroy_all
          phone_count = phone_params["type_ids"].count

          phone_count.times do |index|
            unless phone_params["numbers"][index] == ""
              @contact.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
          end

          redirect_to contact_path(@contact), notice: 'Contact was successfully created.'
          return

        end
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      @job = Job.find_by(id: job_param[:job_id])
        if @address = Address.find_by(id: @contact.address_id)
          if @address.update(address_params)
          end
        else
          @address = Address.new(address_params)
          @address.save
          @contact.address_id = @address.id
        end
            if @contact.update(contact_params)
              unless phone_params.empty?
              @contact.phones.destroy_all
              phone_count = phone_params["type_ids"].count

              phone_count.times do |index|
            unless phone_params["numbers"][index] == ''
              @contact.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
              end
            end
          format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
          format.json { render :show, status: :ok, location: @contact }
        else
          format.html { render :edit }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
            end
    end
  end
  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_suggestions
    @customers = Customer.search_suggestions(params[:term])
    p render json: @customers, include: [:address, :phones]
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.

    def contact_params
      params.require(:contact).permit(:id,
                                      :first_name,
                                      :last_name,
                                      :company_name,
                                      :email,
                                      :job_id,
                                      :owner_id,
                                    phones_attributes: [
                                      :id,
                                      :type_id,
                                      :number,
                                      :extension,
                                      :_destroy
                                    ],
                                    address_attributes: [
                                      :id,
                                      :address_1,
                                      :address_2,
                                      :zip_code,
                                      :city,
                                      :state_id,
                                      :county
                                    ],
                                    uploads_attributes: [
                                      :id,
                                      :upload_category_id,
                                      :description,
                                      {uploads: []}
                                    ],
                                    notes_attributes: [:id, :content],
                                    customer_companies_attributes: [:id, :company_id],
                                    customer_vendors_attributes: [:id, :vendor_id],
                                  )
    end

    def job_param
      params.fetch(:job, {}).permit(:job_id)
    end


    def address_params
        params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    def phone_params
      params.fetch(:phones).permit(numbers:[], extensions:[], type_ids:[])
    end
end
