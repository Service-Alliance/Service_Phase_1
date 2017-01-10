class JobsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :authorize_policy

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
        @job_detail = JobDetail.find_by(job_id: @job.id)
        @agent = Agent.find_by(job_id: @job.id)
        @adjuster = Adjuster.find_by(job_id: @job.id)
        @emergency_contact = EmergencyContact.find_by(job_id: @job.id)
        @images = Image.where(job_id: @job.id)
        @callrail = Call.find_by(job_id: @job.id)
    end

    # GET /jobs/new
    def new
        @job = Job.new
        @caller = Caller.new
        @address = Address.new
        @phone = Phone.new
    end

    # GET /jobs/1/edit
    def edit
        @caller = Caller.find_by(job_id: @job.id)
        @address = @caller.address
        @phone = Phone.find_by(caller_id: @caller.id)

        if params[:billing] == 'true'
            @billing_address = @job.billing_address || @billing_address = Address.new
            render template: 'jobs/billing_form'
        end
    end

    # POST /jobs
    # POST /jobs.json
    def create
        @job = Job.new(job_params)
        @job.entered_by_id = current_user.id
        @caller = Caller.new(caller_params)
        @address = Address.new(address_params)
        @phone = Phone.new(phone_params)
        @call = Call.find_by(id: call_params[:id]) if call_params[:id]

        if @caller.save
            @address.save
            if @job.save
              if @call
                @call.job_id = @job.id
                @call.save
              end
                @caller.job_id = @job.id
                @caller.address_id = @address.id
                @caller.save
                @phone.caller_id = @caller.id
                @phone.save

                if params[:commit] == "Save and Move to Job Loss"
                  redirect_to new_job_loss_path(@job), notice: 'Job was successfully created.'
                elsif params[:commit] == "Save"
                  redirect_to edit_job_path(@job), notice: 'Job was saved successfully.'
                else
                  redirect_to @job, notice: 'Job was successfully created.'
                end
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
        if billing_params != {}
            if billing_params[:type][0] == '1'
                @job.billing_type_id = 1
                @job.billing_address_id = @job.customer.address_id
            elsif billing_params[:type][0] == '2'
                @job.billing_type_id = 2
                @job.billing_address_id = Adjuster.find_by(job_id: @job.id).address_id
            elsif billing_params[:type][0] == '3'
                @job.billing_type_id = 3
                @billing_address = Address.create(address_1: address_params[:address_1], address_2:  address_params[:address_2], city:  address_params[:city], zip_code: address_params[:zip_code], county:  address_params[:county])
                @billing_address.save
                @job.billing_address_id = @billing_address.id
            end
            @job.save
            return redirect_to @job, notice: 'Job was successfully updated.'
        end

        @caller = Caller.find_by(job_id: @job.id)
        @address = @caller.address
        respond_to do |format|
            if @job.update(job_params)
                @caller.update(caller_params)
                @address.update(address_params)
                format.html {
                if params[:commit] == "Save and Move to Job Loss"
                  if @loss = Loss.find_by(job_id: @job.id)
                    redirect_to edit_job_loss_path(@job, @loss), notice: 'Job was successfully updated.'
                  else
                    redirect_to new_job_loss_path(@job), notice: 'Job was successfully updated.'
                  end
                elsif params[:commit] == "Save"
                  redirect_to edit_job_path(@job), notice: 'Job was saved successfully.'
                else
                  redirect_to @job, notice: 'Job was successfully updated.'
                end
              }


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

    def authorize_policy
        authorize Job
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
        params.require(:job).permit(:type_id, :status_id, :entered_by_id, :franchise_id, :details, :notes, :customer_id, :referral_type_id, :billing_address_id, customer: [:address_1, :address_2, :zip, :city, :state_id, :county])
    end

    def caller_params
        params.require(:caller).permit(:first_name, :last_name, :email, :address_1, :address_2, :zip, :city, :state_id, :county)
    end

    def address_params
        params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    def call_params
        params.require(:call).permit(:id)
    end

    def billing_params
        params.fetch(:billing_address, {}).permit(type: [])
    end

    def property_params
        params.require(:property).permit(:structure_type, :year_built, :floors_affected, :rooms_affected, :occured_level, :multi_unit, :ceiling_affected_id, :walls_affected_id, :attic_affected_id, :contents_affected_id, flooring_types: [])
    end

    def phone_params
        params.require(:phone).permit(:number, :extension, :type_id)
    end
end
