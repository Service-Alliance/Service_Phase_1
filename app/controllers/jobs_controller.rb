class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy, :calls, :add_call, :create_call, :create_estimate, :create_estimate_sent, :create_contract, :create_contract_sent]
  # before_action :authorize_policy

  # GET /jobs
  # GET /jobs.json
  def index
    if params[:user_id]
      @jobs = Job.where(entered_by_id: params[:user_id]).paginate(page: params[:page], per_page: 30).order('created_at DESC')
    else
      @search = Job.where.not(status_id: nil).order('created_at DESC').search(params[:q])
      # @jobs = @search.result
      @jobs = @search.result.paginate(page: params[:page], per_page: 30).order('created_at DESC')
    end
  end

  def list
    @jobs = Job.where.not(status_id: nil).last(200)
    render json: @jobs.to_json(include: [:job_status, :job_type, :franchise,
                                         :job_loss_type, :insurance_details,
                                         :job_detail, :customer])
  end

  def no_activity
    @jobs = Job.where('last_action < ? AND status_id = ?', 7.days.ago, 1)
    render json: @jobs.to_json(include: [:job_status, :job_type, :franchise,
                                         :job_loss_type, :insurance_details,
                                         :job_detail, :customer])
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @property = Property.find_by(job_id: @job)
    @phone = Call.find_by(job_id: @job.id)
    @loss = Loss.find_by(job_id: @job.id)
    @caller = Caller.find_by(job_id: @job.id)
    @address = @caller.try(:address)
    @customer = @job.customer
    @occupants = Occupant.where(job_id: @job.id)
    @job_detail = JobDetail.find_by(job_id: @job.id)
    @emergency_contact = EmergencyContact.find_by(job_id: @job.id)
    @uploads = Upload.where(job_id: @job.id)
    @callrail = Call.find_by(job_id: @job.id)
    @scheduler = Scheduler.new
    @upload = Upload.new
  end

  # GET /jobs/new
  def new
    @job = Job.create(entered_by_id: current_user.id, coordinator_id: current_user.id)
    @job.trackers.create(tracker_task_id: 1)
    @loss = Loss.create(job_id: @job.id)
    @caller = Caller.create(job_id: @job.id)
    @address = Address.create
    @caller.address_id = @address.id
    @property = Property.create(job_id: @job.id)
    @caller.save
    @job_detail = JobDetail.create(job_id: @job.id)
    @phones = nil

    # @grouped_people_options = Department.all.map do |department|
    #   [department.name,
    #    department.users.map do |user|
    #      [user.full_name, user.id]
    #    end]
    # end


  end

  # GET /jobs/1/edit
  def edit
    @caller = Caller.find_by(job_id: @job.id)
    if @caller
      @address = @caller.address
      @phones = @caller.phones
    else
      @address = Address.new
      @phones = nil
      @caller = Caller.new
    end

    if params[:billing] == 'true'
      @billing_address = @job.billing_address || @billing_address = Address.new
      render template: 'jobs/billing_form'
    end

    if params[:manager] == 'true'
      @job_manager = @job.job_manager
      render template: 'jobs/manager_form'
    end
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.entered_by_id = current_user.id
    @caller = Caller.new(caller_params)
    @address = Address.new(address_params)

    @call = Call.find_by(id: call_params[:id]) if call_params[:id]
    @job.referral_type_id = nil if @job.try(:referral_type).try(:name) != 'Servpro Employee'
    p franchise = FranchiseZipcode.find_by(zip_code: address_params['zip_code'])
    @job.franchise_id = franchise.id if franchise
    @job.pipeline_status_id = 1

    if @caller.save
      # CustomerMailer.welcome_email(@caller).deliver_now
      @address.save
      if @job.save
        if @call
          @call.job_id = @job.id
          @call.save
        end
        @caller.job_id = @job.id
        @caller.address_id = @address.id
        @caller.save
        @job.update_last_action

        @caller.phones.destroy_all
        phone_count = phone_params['type_ids'].count

        phone_count.times do |index|
          unless phone_params['numbers'][index] == ''
            @caller.phones.create(type_id: phone_params['type_ids'][index], number: phone_params['numbers'][index], extension: phone_params['extensions'][index])
          end
        end

        # @job.create_activity action: 'Created a new Job', job_id: @job.id, owner: current_user

        if params[:commit] == 'Save and Move to Job Loss'
          redirect_to new_job_loss_path(@job), notice: 'Job was successfully created.'
        elsif params[:commit] == 'Save'
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
    respond_to do |format|
      if @job.update(job_params)
        @job.update_last_action
        franchise = FranchiseZipcode.find_by(zip_code: address_params['zip_code'])
        @job.franchise_id = franchise.franchise_id if franchise
        @job.referral_employee_id = nil if @job.try(:referral_type).try(:name) != 'Servpro Employee'
        @job.referral_vendor_id = nil if @job.try(:referral_type).try(:name) != 'Vendor'

        @caller = Caller.find_by(job_id: @job.id)
        if @caller
          @address = @caller.address
          @caller.update(caller_params)
          @address.update(address_params)
        end
        @caller.phones.destroy_all if @caller && @caller.phones
        phone_count = phone_params['type_ids'].count
        phone_count.times do |index|
          unless phone_params['numbers'][index] == ''
            @caller.phones.create(type_id: phone_params['type_ids'][index], number: phone_params['numbers'][index], extension: phone_params['extensions'][index])
          end
        end

        if job_params[:job_manager_id]
          @user = User.find_by(id: job_params[:job_manager_id])
          UserMailer.manager_assignment(@user, @job).deliver_now
          return redirect_to job_job_managers_path(@job)
        end

        format.html do
          if params[:commit] == 'Save and Move to Job Loss'
            if @loss = Loss.find_by(job_id: @job.id)
              redirect_to edit_job_loss_path(@job, @loss), notice: 'Job was successfully updated.'
            else
              redirect_to new_job_loss_path(@job), notice: 'Job was successfully updated.'
            end
          elsif params[:commit] == 'Save'
            redirect_to edit_job_path(@job), notice: 'Job was saved successfully.'
          else
            redirect_to @job, notice: 'Job was successfully updated.'
          end
        end

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

  def create_estimate
    @job.estimate_created = true
    @job.estimate_created_date = Date.today
    @job.trackers.create(tracker_task_id: 3, child_id: @job_id)
    @job.pipeline_status_id = 4
    @job.save
    redirect_to '/', notice: 'Job Estimate Created.'
  end

  def create_estimate_sent
    @job.estimate_sent = true
    @job.estimate_sent_date = Date.today
    @job.trackers.create(tracker_task_id: 4, child_id: @job_id)
    @job.pipeline_status_id = 5
    @job.save
    redirect_to '/', notice: 'Job Estimate Sent.'
  end

  def create_contract
    @job.contract_created = true
    @job.contract_created_date = Date.today
    @job.trackers.create(tracker_task_id: 5, child_id: @job_id)
    @job.pipeline_status_id = 6
    @job.save
    redirect_to '/', notice: 'Job contract Created.'
  end

  def create_contract_sent
    @job.contract_sent = true
    @job.contract_sent_date = Date.today
    @job.trackers.create(tracker_task_id: 6, child_id: @job_id)
    @job.pipeline_status_id = 7
    @job.save
    redirect_to '/', notice: 'Job contract Sent.'
  end

  def calls
    @calls = Call.where(job_id: @job.id)
  end

  def add_call; end

  def create_call
    @call = Call.find_by(id: call_params[:id])
    @call.job_id = @job.id
    @call.save

    redirect_to job_calls_path(@job)
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
    params.require(:job).permit(:type_id, :status_id,
                                :entered_by_id, :details,
                                :job_note, :customer_id, :referral_type_id, :referral_note, :corporate_referral_type_id,
                                :billing_address_id, :emergency,
                                :referral_employee_id, :referral_vendor_id, :job_manager_id, :franchise_id, :coordinator_id, :name,
                                customer: [:address_1, :address_2, :zip_code, :city,
                                           :state_id, :county])
  end

  def caller_params
    params.fetch(:caller, {}).permit(:first_name, :last_name, :email, :address_1,
                                     :address_2, :zip, :city, :state_id, :county)
  end

  def address_params
    params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city,
                                      :state_id, :county)
  end

  def call_params
    params.fetch(:call, {}).permit(:id)
  end

  def property_params
    params.require(:property).permit(:structure_type, :year_built,
                                     :floors_affected, :rooms_affected,
                                     :occurred_level, :multi_unit,
                                     :ceiling_affected_id,
                                     :walls_affected_id, :attic_affected_id,
                                     :contents_affected_id, flooring_types: [])
  end

  def phone_params
    params.require(:phones).permit(numbers: [], extensions: [], type_ids: [])
  end
end
