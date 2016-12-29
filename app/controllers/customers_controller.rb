class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]


  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @address = Address.new
    @job = Job.find_by(id: params[:job_id])
    @phone = Phone.new
  end

  # GET /customers/1/edit
  def edit
    @address = Address.find_by(id: @customer.address_id) || @address = Address.new
    @phone = Phone.find_by(customer_id: @customer.id) || @phone = Phone.new
    @job = Job.find_by(id: params[:job_id])

  end

  # POST /customers
  # POST /customers.json
  def create
    # TODO: If address is same as caller address, do not recreate.
    @customer = Customer.new(customer_params)
    @address = Address.new(address_params)
    @job = Job.find_by(id: job_param[:job_id])
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @customer.save
        if @job
          @job.customer_id = @customer.id
          if @job.save
            @phone.customer_id = @customer.id
            @phone.save
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
      @job = Job.find_by(id: job_param[:job_id])
      if @address = Address.find_by(id: @customer.address_id)

        if @address.update(address_params)
        end
      else
        @address = Address.new(address_params)
        @address.save
        @customer.address_id = @address.id
      end
      if @customer.update(customer_params)
        @phone = Phone.find_by(customer_id: @customer.id)
        @phone.update(phone_params)
        format.html { redirect_to job_path(@job), notice: 'Customer was successfully updated.' }
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
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
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

    @customer = Customer.new(first_name: @caller.first_name, last_name: @caller.last_name, email: @caller.email, address_id: @address.id)
    @customer.save

    @job.customer_id = @customer.id


    @phone = Phone.new(number: @caller_phone.number, extension: @caller_phone.extension, customer_id: @customer.id, type_id: @caller_phone.type_id)
    @phone.save

    @job.save
    redirect_to job_path(@job), notice: 'Customer was successfully replicated from caller.'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :job_id)
    end

    def job_param
      params.require(:job).permit(:job_id)
    end

    def address_params
        params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    def phone_params
        params.require(:phone).permit(:number, :extension, :type_id)
    end
end
