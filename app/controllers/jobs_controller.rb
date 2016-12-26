class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :set_customer, only: [:edit, :update]

    # GET /jobs
    # GET /jobs.json
    def index
        @jobs = Job.all
    end

    # GET /jobs/1
    # GET /jobs/1.json
    def show
        @property = Property.find_by(job_id: @job)
        @phone = Call.find_by(job_id: @job.id)
        @loss = Loss.find_by(job_id: @job.id)
        @caller = Caller.find_by(job_id: @job.id)
        @address = @caller.address
        @customer = @job.customer
        @occupants = Occupant.where(job_id: @job.id)
    end

    # GET /jobs/new
    def new
        @job = Job.new
        @caller = Caller.new
        @property = Property.new
        @address = Address.new
    end

    # GET /jobs/1/edit
    def edit
    end

    # POST /jobs
    # POST /jobs.json
    def create
        @job = Job.new(job_params)
        @job.entered_by_id = 1
        @caller = Caller.new(caller_params)
        @address = Address.new(address_params)

        if @caller.save
            @address.save
            if @job.save
                @caller.job_id = @job.id
                @caller.address_id = @address.id
                @caller.save
                redirect_to @job, notice: 'Job was successfully created.'
            else
                render :new
            end
        else
            render :new
        end
    end

    # PATCH/PUT /jobs/1
    # PATCH/PUT /jobs/1.json
    def update
        respond_to do |format|
            if @job.update(job_params)
                @customer.update(customer_params)
                format.html { redirect_to @job, notice: 'Job was successfully updated.' }
                format.json { render :show, status: :ok, location: @job }
            else
                format.html { render :edit }
                format.json { render json: @job.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /jobs/1
    # DELETE /jobs/1.json
    def destroy
        @job.destroy
        respond_to do |format|
            format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_job
        @job = Job.find(params[:id])
    end

    def set_customer
        @customer = Customer.find(@job.customer_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
        params.require(:job).permit(:type_id, :status_id, :entered_by_id, :franchise_id, :details, :notes, :customer_id, :referral_type_id, customer: [:address_1, :address_2, :zip, :city, :state_id, :county])
    end

    def caller_params
        params.require(:caller).permit(:first_name, :last_name, :email, :address_1, :address_2, :zip, :city, :state_id, :county)
    end

    def address_params
        params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    def property_params
        params.require(:property).permit(:structure_type, :year_built, :floors_affected, :rooms_affected, :occured_level, :multi_unit, :ceiling_affected_id, :walls_affected_id, :attic_affected_id, :contents_affected_id, flooring_types: [])
    end
end
