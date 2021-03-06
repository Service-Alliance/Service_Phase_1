class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy, :create_call]


  # GET /customers
  # GET /customers.json
  def index
    @search = Customer.where.not(first_name: nil).order('created_at DESC').search(params[:q])
    # @jobs = @search.result
    @customers = @search.result.page(params[:page]).order('created_at DESC')
    @all_results = @search.result
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @job = Job.find_by(id: params[:job_id])
    @note = @customer.notes.new
    @uploads = @customer.uploads.build


  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @address = Address.new
    @job = Job.find_by(id: params[:job_id])
    @customer_address = Address.new
    @phones = nil
    @customer_companies = @customer.customer_companies.build
  end

  # GET /customers/1/edit
  def edit
    @job = Job.find_by(id: params[:job_id])
    @phones = @customer.phones
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @job = Job.find_by(id: job_param[:job_id])

    respond_to do |format|
      if @customer.save
        if @job
          @job.customer_id = @customer.id
          if @job.save
            @customer.phones.destroy_all
            phone_count = phone_params["type_ids"].count

            phone_count.times do |index|
              unless phone_params["numbers"][index] == ""
                @customer.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
              end
            end
            redirect_to job_path(@job), notice: 'Customer was successfully created.'
            return
          else
            render :new
            return
          end
        else
          @customer.phones.destroy_all
          phone_count = phone_params["type_ids"].try(:count) || 0

          phone_count.times do |index|
            unless phone_params["numbers"][index] == ""
              @customer.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
          end
          redirect_to customer_path(@customer), notice: 'Customer was successfully created.'
          return
        end
        format.html { redirect_to job_path(@job), notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if job_param[:job_id]
        @job = Job.find_by(id: job_param[:job_id])
      end

      unless customer_exists_params['customer_id'] == "0" || customer_exists_params.empty?
        @customer = Customer.find(customer_exists_params['customer_id'])
        @job.customer_id = @customer.id
        @job.save
      end
      unless company_params.empty?
        unless company_params[:company_name] == ""
          @company = Company.create!(name: company_params[:company_name])
          CustomerCompany.create(customer_id: @customer.id, company_id: @company.id)
        end
      end

      if @customer.update(customer_params)
        @customer.add_owner_as_subscriber
        unless phone_params.empty?
          @customer.phones.destroy_all
          phone_count = phone_params["type_ids"].count

          phone_count.times do |index|
            unless phone_params["numbers"][index] == ""
              @customer.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
          end
        end
        if customer_params[:notes_attributes]
          @note = @customer.notes.last
          @customer.track 'Note Created', current_user, @note
        end
        if customer_params[:uploads_attributes]
          @upload = @customer.uploads.last
          @customer.track 'File Uploaded', current_user, @upload
        end

        format.html {
          unless job_param.empty?
            return redirect_to job_path(@job), notice: 'Customer was successfully updated.'
          else
            return redirect_to customer_path(@customer), notice: 'Customer was successfully updated.'
          end

        }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    @customer.phones.destroy_all
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def samecaller
    @job = Job.find_by(id: params[:job_id])
    @caller = Caller.find_by(job_id: @job.id)
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
    redirect_to customer_path(@customer, job_id: @job.id), notice: 'Customer was successfully replicated from caller.'
  end

  def create_call
    # FIXME: this is almost exact copy of jobs_controller#create_call
    @call = Call.find(call_params[:call_id])
    @call.customer_id = @customer.id
    @customer.track 'Call Assigned', current_user, @call
    @call.save
    redirect_to @customer
  end

  def send_to_sharpspring
    @customer = Customer.find(params[:customer_id])
    @job = Job.find(params[:job_id])
    @customer.send_to_sharpspring(@job.franchise)
    redirect_to @job
  end

  def search_suggestions
    @customers = Customer.search_suggestions(params[:term])
    p render json: @customers, include: [:address, :phones]
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def call_params
      params.fetch(:call, {}).permit(:id, :call_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:id,
                                       :first_name, 
                                       :last_name, 
                                       :email, 
                                       :job_id, 
                                       :owner_id, 
                                       :company_name, 
                                       uploads_attributes: [
                                         :id,
                                         :upload_category_id,
                                         :description,
                                         {uploads: []}
                                       ],
                                       notes_attributes: [:id, :content],
                                       customer_companies_attributes: [:id, :company_id],
                                       customer_vendors_attributes: [:id, :vendor_id],
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
                                       ]
                                      )
    end

    def job_param
      params.fetch(:job, {}).permit(:job_id)
    end
    def customer_exists_params
      params.fetch(:customer_exists, {}).permit(:customer_id)
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
end
