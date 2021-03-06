class WorkOrdersController < ApplicationController

  before_action :set_presenter, only: %i(show edit)
  before_action :set_work_order, only: %i(show edit update destroy acknowledge archive unarchive)
  before_action :set_job, except: :list

  # GET /work_orders
  # GET /work_orders.json
  def index
    @work_orders = @job.work_orders
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    job = Job.find(params[:job_id])
    @work_order = WorkOrder.build_from_job(job, current_user.full_name)
    @work_order_presenter = WorkOrderPresenter.new(@work_order, view_context)
  end

  # GET /work_orders/1/edit
  def edit
    redirect_to job_work_order_path(@work_order.job, @work_order) and return if @work_order.archived?
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)
    @work_order.job_id = @job.id

    respond_to do |format|
      if @work_order.save
        WorkOrderDraftDeliveryService.new(@work_order, current_user).deliver!
        @job.track 'Work Order Drafted', current_user, @work_order
        @job.pipeline_status_id = 8
        if @job.status_id == 1
          @job.status_id = 2
        end
        @job.save
        format.html { redirect_to job_work_order_path(@job, @work_order), notice: 'Work Order was Drafted and Scheduling Manager Notified.' }
        format.json { render :show, status: :created, location: @work_order }
      else
        set_presenter
        format.html { render :new }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_orders/1
  # PATCH/PUT /work_orders/1.json
  def update
    respond_to do |format|
      if @work_order.update(work_order_params)
        @work_order.publish!(current_user) if params[:commit] == 'Publish Work Order' && !@work_order.published?
        format.html { redirect_to job_path(@job), notice: 'Work Order has been delivered successfully.' }
        format.json { render :show, status: :ok, location: @work_order }
      else
        set_presenter
        format.html { render :edit }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    job = @work_order.job
    @work_order.destroy
    respond_to do |format|
      format.html { redirect_to job, notice: 'Work Order has been deleted.' }
      format.json { head :no_content }
    end
  end

  def archive
    @work_order.archive!
    respond_to do |format|
      format.html { redirect_to job_work_order_path(@work_order.job, @work_order), notice: 'Work Order has been archived.' }
      format.json { head :no_content }
    end
  end

  def unarchive
    @work_order.unarchive!
    respond_to do |format|
      format.html { redirect_to job_work_order_path(@work_order.job, @work_order), notice: 'Work Order has been unarchived.' }
      format.json { head :no_content }
    end
  end

  def list
    @work_orders = WorkOrder.includes(:job, :vendor, :crew, job: [:franchise, :customer])
    @work_orders = @work_orders.where(jobs: { franchise_id: params[:franchise_id] }) if params[:franchise_id]
  end

  def acknowledge
    @work_order.acknowledgement = true
    @work_order.acknowledged_by_id = current_user.id
    @work_order.save
    redirect_to "/", notice: 'Work Order Acknowledged.'
  end

  private
  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  def set_presenter
    work_order = params[:id].present? ? WorkOrder.find(params[:id]) : WorkOrder.new
    @work_order_presenter = WorkOrderPresenter.new(work_order, view_context)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def work_order_params
    params.require(:work_order).permit(
      :job_id,
      :to,
      :name,
      :typed_by,
      :job_start,
      :job_name,
      :job_location,
      :telephone,
      :contact,
      :insurance,
      :claim_number,
      :required,
      :referral,
      :franchise_location,
      :scope_of_work,
      :job_manager_contact_info,
      :acknowledgement,
      :acknowledged_by_id,
      :hours_on_job,
      :consumables_required?,
      :adjuster,
      :number_of_crew_chiefs,
      :number_of_technicians,
      :estimated_hours,
      :vendor_id,
      technician_ids: [],
      crew_chief_ids: [],
      work_shifts_attributes: [
        :id,
        :user_id,
        :date,
        :start,
        :end,
        :_destroy,
        breaks_attributes: [
          :id,
          :start,
          :end,
          :_destroy
        ]
      ])
  end

  def work_order_send_to_params
    params.fetch(:work_order_send_to, {}).permit(send_to: [])
  end
end
