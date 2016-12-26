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
  end

  # GET /customers/1/edit
  def edit
    @address = Address.find_by(id: @customer.address_id) || @address = Address.new
  end

  # POST /customers
  # POST /customers.json
  def create
    # TODO: If address is same as caller address, do not recreate.
    @customer = Customer.new(customer_params)
    @address = Address.new(address_params)
    @job = Job.find_by(id: job_param[:job_id])

    respond_to do |format|
      if @customer.save
        if @job
          @job.customer_id = @customer.id
          if @job.save
            redirect_to @customer, notice: 'Customer was successfully created.'
            return
          else
            render :new
            return
          end
        end
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
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
      if @address = Address.find_by(id: @customer.address_id)
        if @address.update(address_params)
        end
      else
        @address = Address.new(address_params)
        @address.save
        @customer.address_id = @address.id
      end
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
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

  def geolocate
    if request.xhr?
      @response = Geocoder.search(params[:data])

      render json: @response
    end
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
end
