class WorkOrdersController < ApplicationController

  before_action :set_work_order, only: [:update, :destroy, :acknowledge]
  before_action :set_job, except: :list
  before_action :set_presenter, only: [:show, :new, :edit]

  # GET /work_orders
  # GET /work_orders.json
  def index
    @work_orders = WorkOrder.all
  end

  # GET /work_orders/1
  # GET /work_orders/1.json
  def show
  end

  # GET /work_orders/new
  def new
    job = Job.find(params[:job_id])
    @work_order = WorkOrderPresenter.new(WorkOrder.build_from_job(job, current_user.full_name), view_context)
  end

  # GET /work_orders/1/edit
  def edit
    @work_order = WorkOrderPresenter.new(WorkOrder.find(params[:id]), view_context)
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)
    @work_order.job_id = @job.id

    respond_to do |format|
      if @work_order.save
        tracker_task = TrackerTask.find_by(name: "Work Order Drafted")
        @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @work_order.id, user_id: current_user.id)
        WorkOrderDraftDeliveryService.new(@work_order, current_user).deliver!
        @job.pipeline_status_id = 8
        if @job.status_id == 1
          @job.status_id = 2
        end
        @job.save
        format.html { redirect_to job_path(@job), notice: 'Work Order was Drafted and Scheduling Manager Notified.' }
        format.json { render :show, status: :created, location: @work_order }
      else
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
        tracker_task = TrackerTask.find_by(name: "Work Order Delivered")
        @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @work_order.id, user_id: current_user.id)
        WorkOrderPublishDeliveryService.new(@work_order, current_user).deliver!
        format.html { redirect_to job_work_order_path(@job, @work_order), notice: 'Work Order has been delivered successfully' }
        format.json { render :show, status: :ok, location: @work_order }
      else
        format.html { render :edit }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.json
  def destroy
    @work_order.destroy
    respond_to do |format|
      format.html { redirect_to work_orders_url, notice: 'Work Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def list
    @work_orders = WorkOrder.includes(:job, :vendors, job: :franchise).limit(200)
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
    @work_order = WorkOrderPresenter.new(work_order, view_context)
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
      :vendor_id,
      :hours_on_job,
      :adjuster,
      :number_of_crew_chiefs,
      :number_of_technicians,
      :estimated_hours,
      technician_ids: [],
      crew_chief_ids: [],
      vendor_ids: [])
  end

  def work_order_send_to_params
    params.fetch(:work_order_send_to, {}).permit(send_to: [])
  end
end
