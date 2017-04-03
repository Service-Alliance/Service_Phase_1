class WorkOrdersController < ApplicationController

  before_action :set_work_order, only: [:show, :edit, :update, :destroy]
  before_action :set_job, except: :list

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
    @work_order = WorkOrder.new
  end

  # GET /work_orders/1/edit
  def edit
  end

  # POST /work_orders
  # POST /work_orders.json
  def create
    @work_order = WorkOrder.new(work_order_params)
    @work_order.job_id = @job.id

    respond_to do |format|
      if @work_order.save
        work_order_send_to_params[:send_to].each do |user|
          unless user == ""
            @user = User.find(user)
            UserMailer.work_order_notification(@user, @job, @work_order).deliver_now
          end
          sched_manager = User.find_by(email: "sgreer@servpro5933.com")
          job_coordinator = User.find(@job.coordinator_id)
          UserMailer.work_order_notification(sched_manager, @job, @work_order).deliver_now if sched_manager
          UserMailer.work_order_notification(sched_manager, @job, @work_order).deliver_now if job_coordinator
          if @job.status_id == 1
            @job.status_id = 2
            @job.save
          end
        end
        format.html { redirect_to job_work_order_path(@job, @work_order), notice: 'Work Order was successfully created.' }
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
        work_order_send_to_params[:send_to].each do |user|
          unless user == ""
            @user = User.find(user)
            UserMailer.work_order_notification(@user, @job, @work_order).deliver_now
          end
        end
        format.html { redirect_to job_work_order_path(@job, @work_order), notice: 'Work Order was successfully updated.' }
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
    @work_orders = WorkOrder.last(200)
    render json: @work_orders.to_json
    # (include: [:job_status, :job_type, :franchise,
    #                                      :job_loss_type, :insurance_details,
    #                                      :job_detail, :customer])
  end

  private
  def set_work_order
    @work_order = WorkOrder.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

    def work_order_params
      params.require(:work_order).permit(:job_id, :to, :name, :date, :typed_by, :job_start, :job_name, :job_location, :telephone, :contact, :insurance, :claim_number, :crew, :approx_time_on_loss, :required, :referral, :franchise_location, :scope_of_work, :job_manager_contact_info)
    end

    def work_order_send_to_params
      params.require(:work_order_send_to).permit(send_to:[])
    end
end
