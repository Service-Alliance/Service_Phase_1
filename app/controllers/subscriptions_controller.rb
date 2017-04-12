class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /vendor_categories
  # GET /vendor_categories.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /vendor_categories/1
  # GET /vendor_categories/1.json
  def show
  end

  # GET /vendor_categories/new
  def new
    @subscription = Subscription.new
  end

  # GET /vendor_categories/1/edit
  def edit
  end

  # POST /vendor_categories
  # POST /vendor_categories.json
  def create
    @subscription = Subscription.new(subscription_params)

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to job_subscriptions_path(@job), notice: 'Subscription was successfully created.' }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_categories/1
  # PATCH/PUT /vendor_categories/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to job_subscription_path(@job, @subscription), notice: 'Vendor category was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_categories/1
  # DELETE /vendor_categories/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to job_subscriptions_path(@job), notice: 'Vendor category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:user_id, :job_id)
    end
end
