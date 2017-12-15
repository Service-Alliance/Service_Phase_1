class JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show,
                                 :edit,
                                 :update,
                                 :destroy,
                                 :calls,
                                 :add_call,
                                 :create_estimate,
                                 :create_estimate_sent,
                                 :create_contract,
                                 :create_contract_sent]
  before_action :verify_user, only: [:show,
                                     :edit,
                                     :update,
                                     :destroy,
                                     :calls,
                                     :add_call,
                                     :create_estimate,
                                     :create_estimate_sent,
                                     :create_contract,
                                     :create_contract_sent]


  # GET /jobs
  # GET /jobs.json
  def index
    @search = Job.where.not(status_id: nil).search(params[:q])
    @jobs = JobsPresenter.new(@search.result, view_context, params[:page])

    respond_to do |format|
      format.html
      format.csv do
        @jobs = @jobs.for_csv
      end
    end
  end

  def list
    @jobs = Job.where.not(status_id: nil)
      .includes(job_associations)
      .limit(100)
    @jobs = @jobs.where(franchise_id: params[:franchise_id]) if params[:franchise_id]
    render json: @jobs.to_json(include: job_json_includes)
  end

  def new_york_datasheet
    jim = User.find_by(email: 'jbertini@servpro5933.com')
    duct = LossType.find_by(name: "Duct Cleaning")
    state_farm = InsuranceCompany.find_by(name: "State Farm")
    @first = Job.where.not(status_id: nil).where(franchise_id: [1,2,3,4])
    p @search = @first.order('created_at DESC').search(params[:q], franchise_id_in: [1,2,3,4], job_detail_insurance_company_id_eq: nil)
    @duct = Job.joins(:losses).merge(Loss.where(loss_type_id: duct.id))
    @state_farm = Job.joins(:job_detail).merge(JobDetail.where(insurance_company_id: state_farm.id))
    @jim = Job.joins(:referral).where(referral: {associated_record_id: jim.id, associated_record_type: 'User'})

    @jobs = @search.result.page(params[:page]).order('created_at DESC')
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @property = @job.property
    @phone = Call.find_by(job_id: @job.id)
    @loss = Loss.find_by(job_id: @job.id, fnol_received: Time.now)
    @caller = @job.caller
    @address = @caller.try(:address)
    @customer = @job.customer
    @occupants = @job.occupants
    @job_detail = @job.job_detail
    @emergency_contact = @job.emergency_contact
    @uploads = @job.uploads
    @callrail = Call.find_by(job_id: @job.id)
    @scheduler = Scheduler.new
    @upload = Upload.new
    @purchase_order_approval = PurchaseOrderApproval.new
    @future_schedules = []
    @past_schedules = []
    @note = @job.notes.new

    @work_order = WorkOrderPresenter.new(WorkOrder.build_from_job(@job, current_user.full_name), view_context)

    @inspection_checklist = InspectionChecklist.new
    @job.schedulers.each do |scheduler|
      if scheduler.event_date.future? || scheduler.event_date.today?
        @future_schedules << scheduler
      end
    end
    @pricing = Pricing.new
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @loss = @job.losses.build
    @caller = Caller.new
    @property = @job.build_property
    @job_detail = @job.build_job_detail
    @customer = @job.build_customer
    @customer.phones.build
    render :new
  end

  # GET /jobs/1/edit
  def edit
    @caller = Caller.find_by(job_id: @job.id)
    if @caller
      @address = @caller.address
      @caller_phones = @caller.phones
    else
      @address = Address.new
      @caller_phones = nil
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

  def create
    job = JobBuilder.call(
      job_params,
      caller_params,
      address_params,
      phone_params,
      company_params[:name],
      call_params[:id],
      current_user.id
    )

    Customer.same_as_caller(job) if same_caller_params[:same_indicator] == "1"

    if params[:commit] == 'Save and Move to Job Loss'
      redirect_to new_job_loss_path(job), notice: 'Job was successfully created.'
    elsif params[:commit] == 'Save'
      redirect_to edit_job_path(job), notice: 'Job was saved successfully.'
    else
      redirect_to job, notice: 'Job was successfully created.'
    end

  rescue JobBuilder::SaveError => e
    Honeybadger.notify(e)
    render :new
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    # FIXME: Decrease complexity of this code -- introduce workers!
    # as the form is now nested we can probably get rid of a lot of this, just need to make sure it's covered with tests before removing
    @previous_status = Job.find(params[:id])
    respond_to do |format|
      if @job.update(job_params)
        @job.franchise_id = FranchiseZipcode.detect_franchise(address_params['zip_code'])
        @job.update(job_params)
        @job.save

        @job.moving_to_invoiced(@previous_status.status_id, @job.status_id, @job)

        @caller = Caller.find_by(job_id: @job.id)
        if @caller
          @address = @caller.address
          @caller.update(caller_params)
          @address.update(address_params)
          if company_params[:name].present?
            company = Company.find_or_create_by(name: company_params[:name])
            company.address = @address if company.address.blank?
            company.save
            @caller.add_company(company)
          end
        end
        unless phone_params.empty?
          @caller.phones.destroy_all if @caller && @caller.phones
          phone_count = phone_params['type_ids'].count
          phone_count.times do |index|
            unless phone_params['numbers'][index] == ''
              @caller.phones.create(type_id: phone_params['type_ids'][index], number: phone_params['numbers'][index], extension: phone_params['extensions'][index])
            end
          end
        end

        if job_params[:job_manager_id]
          @user = User.find_by(id: job_params[:job_manager_id])
          UserMailer.manager_assignment(@user, @job).deliver_later
          return redirect_to job_job_managers_path(@job)
        end

        if new_params[:newly_created] == "true" && current_user.call_rep?
          notify_type = NotifyType.find_by(name: "Call Rep Created Job")
          call_rep = Role.find_by(name: "Call Rep")
          User.where(role_id: call_rep.id).each do |user|
            Notification.create(notify_type: notify_type.id,actor_id: current_user.id, target_id: user.id, job_id: @job.id, notify_text: "Call Rep #{current_user.full_name} created a job.")
          end
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

  def reconciliation_form
    @job = JobPresenter.new(Job.find(params[:job_id]), view_context)
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
    respond_to do |format|
      format.html { }
      format.json {render json: @calls }
    end

  end

  def caller_assignment
    @job = Job.find(params[:job_id])
    if @caller = @job.caller
      @caller.update(caller_params)
      @caller.address.update(address_params)
    else
        @job.caller.create(caller_params)
    end
    redirect_to @job
  end

  def manager_assignment
    @job = Job.find(params[:job_id])
    @user = User.find(params[:job_manager_id])

    unless @job.job_managers.pluck(:job_manager_id).include?(@user.id)
      @job_manager = @job.job_managers.create(job_manager_id: @user.id)
      @job.pipeline_status_id = 2
      @job.save

      @job.trackers.create(tracker_task_id: 2, child_id: @job_manager.id)
      if @user.email
        UserMailer.manager_assignment(@user, @job_manager).deliver_later
      end
      return redirect_to @job, notice: 'Job Manager Added.'
    else
      return redirect_to @job, notice: 'Error Adding Manager.'
    end
  end

  def destroy_manager_assignment
    @job = Job.find(params[:job_id])
    @manager = JobManager.find(params[:id])

    if @manager.destroy
      return redirect_to @job, notice: 'Job Manager Removed.'
    else
      return redirect_to @job, notice: 'Error Removing Manager.'
    end
  end

  def customer
    @job = Job.find(params[:job_id])
    @customer = Customer.find(params[:id])
  end

  def add_call; end

  def create_call
    @call = Call.find_by(id: call_params[:id])
    @job =  Job.find_by(id: call_params[:job_id])
    @call.job_id = @job.id
    @call.save
    tracker_task = TrackerTask.find_by(name: "Call Assigned")
    @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @call.id, user_id: current_user.id, note: call_params[:note])

    redirect_to job_path(@job), notice: 'Call was successfully added to Job.'
  end

  private

  def job_associations
    [:job_status, :job_type, :franchise, :job_detail, :customer, :losses, {job_detail: :insurance_company}, {losses: :loss_type}]
  end

  def job_json_includes
    [:job_status, :job_type, :franchise, :job_detail, :customer, :insurance_details, :job_loss_type]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  def verify_user
    if current_user.contractor?
      subs = current_user.subscriptions.pluck(:job_id)
      if subs.include?(@job.id)
        true
      else
        redirect_to "/"
      end
    else
      true
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def job_params
    params.require(:job).permit(:type_id,
                                :status_id,
                                :entered_by_id,
                                :details,
                                :job_note,
                                :customer_id,
                                :referral_type_id,
                                :referral_note,
                                :corporate_referral_type_id,
                                :billing_address_id,
                                :emergency,
                                :referral_employee_id,
                                :referral_vendor_id,
                                :job_manager_id,
                                :franchise_id,
                                :coordinator_id,
                                :name,
                                :same_caller,
                                :work_center_link,
                                :xact_link,
                                customer_attributes: [
                                  :id,
                                  :first_name,
                                  :last_name,
                                  :email,
                                  :address_1,
                                  :address_2,
                                  :zip_code,
                                  :city,
                                  :state_id,
                                  :county,
                                  phones_attributes: [
                                    :id,
                                    :type_id,
                                    :number,
                                    :extension,
                                    :_destroy
                                  ],
                                  address_attributes: [
                                    :address_1,
                                    :address_2,
                                    :zip_code,
                                    :city,
                                    :state_id,
                                    :county
                                  ]
                                ],
                                losses_attributes: [
                                  :id,
                                  :loss_occurred,
                                  :fnol_received,
                                  :customer_called,
                                  :loss_type_id,
                                  :loss_cause_id,
                                  :standing_water_id,
                                  :water_available_id,
                                  :electricity_available_id,
                                  :source_off_id,
                                  :visible_mold_id,
                                  :source_cause,
                                  :cleaning_type,
                                  :affected_square_footage,
                                  :notes
                                ],
                                property_attributes: [
                                  :id,
                                  :structure_type_id,
                                  :property_type_id,
                                  :year_built,
                                  :floors_affected,
                                  :rooms_affected,
                                  :occurred_level,
                                  :basement_finished,
                                  :multi_unit,
                                  :ownership,
                                  :condo,
                                  flooring_type_ids: []],
                                job_detail_attributes: [
                                  :id,
                                  :insurance_company_id,
                                  :claim_number,
                                  :policy_number,
                                  :coverage_type,
                                  :deductible_amount,
                                  :emergency_service_amount
                                ],
                                referral_attributes: [
                                  :id,
                                  :referral_type_id,
                                  :associated_record_id,
                                  :associated_record_type,
                                  :sub_referral_type_id,
                                  :notes
                                ]
                               )
  end

  def new_params
    params.fetch(:new, {}).permit(:newly_created)
  end

  def caller_params
    params.fetch(:caller, {}).permit(:company_name, :company_id, :first_name, :last_name, :email, :address_1,
                                     :address_2, :zip, :city, :state_id, :county)
  end

  def address_params
    params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city,
                                      :state_id, :county)
  end


  def call_params
    params.fetch(:call, {}).permit(:id, :job_id, :note)
  end

  def same_caller_params
    params.fetch(:same_caller, {}).permit(:same_indicator)
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
    params.fetch(:phones, {}).permit(numbers: [], extensions: [], type_ids: [])
  end

  def company_params
    params.fetch(:company, {}).permit(:name)
  end
end
