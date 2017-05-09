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
  end

  # GET /customers/1/edit
  def edit
    @customer_address = Address.find_by(id: @customer.address_id) || @customer_address = Address.new
    @phones = @customer.phones
    @job = Job.find_by(id: params[:job_id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @address = Address.new(address_params)
    @job = Job.find_by(id: job_param[:job_id])
    @job.update_last_action


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
        @job.update_last_action
      end
      if @address = Address.find_by(id: @customer.address_id)
        if @address.update(address_params)
        end
      else
        @address = Address.new(address_params)
        @address.save
        @customer.address_id = @address.id
      end
      if @customer.update(customer_params)
        unless phone_params.empty?
          @customer.phones.destroy_all
          phone_count = phone_params["type_ids"].count

          phone_count.times do |index|
            unless phone_params["numbers"][index] == ""
              @customer.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
          end
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
    @call = Call.find(call_params[:call_id])
    @call.customer_id = @customer.id
    @call.save
    redirect_to @customer
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
      params.require(:customer).permit(:first_name, :last_name, :email, :job_id, :owner_id, uploads_attributes: [:upload, :upload_category_id], notes_attributes: [:content] )
    end

    def job_param
      params.fetch(:job, {}).permit(:job_id)
    end

    def address_params
        params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    def phone_params
      params.fetch(:phones, {}).permit(numbers:[], extensions:[], type_ids:[])
    end
end
