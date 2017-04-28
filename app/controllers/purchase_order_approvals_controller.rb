class PurchaseOrderApprovalsController < ApplicationController
  before_action :set_purchase_order_approval, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /purchase_order_approvals
  # GET /purchase_order_approvals.json
  def index
    @purchase_order_approvals = PurchaseOrderApproval.all
  end

  # GET /purchase_order_approvals/1
  # GET /purchase_order_approvals/1.json
  def show
  end

  # GET /purchase_order_approvals/new
  def new
    @purchase_order_approval = PurchaseOrderApproval.new
  end

  # GET /purchase_order_approvals/1/edit
  def edit
  end

  # POST /purchase_order_approvals
  # POST /purchase_order_approvals.json
  def create
    @purchase_order_approval = PurchaseOrderApproval.new(purchase_order_approval_params)
    @purchase_order_approval.job_id = @job.id

    respond_to do |format|
      if @purchase_order_approval.save
        tracker_task = TrackerTask.find_by(name: "Purchase Order Created")
        @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @purchase_order_approval.id, user_id: current_user.id)

        format.html { redirect_to @job, notice: 'Purchase Order Approval was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_order_approvals/1
  # PATCH/PUT /purchase_order_approvals/1.json
  def update
    respond_to do |format|
      if @purchase_order_approval.update(purchase_order_approval_params)
        format.html { redirect_to job_purchase_order_approval_path(@job, @purchase_order_approval), notice: 'Purchase Order Approval was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_approval }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_approval.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_approvals/1
  # DELETE /purchase_order_approvals/1.json
  def destroy
    @purchase_order_approval.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_approvals_url, notice: 'Purchase Order Approval was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_approval
      @purchase_order_approval = PurchaseOrderApproval.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_approval_params
      params.require(:purchase_order_approval).permit(:date, :job_name, :vendor, :purchase_item, :amount, :last_four_card)
    end
end
