class PricingsController < ApplicationController
  before_action :set_pricing, only: [:show, :edit, :update, :destroy]
  before_action :set_job


  # GET /pricings
  # GET /pricings.json
  def index
    @pricings = Pricing.all
  end

  # GET /pricings/1
  # GET /pricings/1.json
  def show
  end

  # GET /pricings/new
  def new
    @pricing = Pricing.new
  end

  # GET /pricings/1/edit
  def edit
  end

  def move_to_next
    @job = Job.find(params[:job_id])
    @pricing = Pricing.find(params[:pricing_id])
    @category_id = 0
    if  @pricing.pricing_category_id &&  @pricing.pricing_category_id < 4
      @category_id = @pricing.pricing_category_id + 1
      p @category_id
    else
      @category_id = 3
    end

    tracker_task = TrackerTask.find_by(name: "Pricing Created")

    @new_pricing = Pricing.create(job_id: @job.id, current_status_id: @job.status_id, pricing_category_id: @category_id, description: "Moved to next category" )

    @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @new_pricing.id, user_id: current_user.id)
    redirect_to @job, notice: 'Pricing was successfully created.'
  end

  # POST /pricings
  # POST /pricings.json
  def create
    @pricing = Pricing.new(pricing_params)
    @pricing.job_id = @job.id
    @pricing.current_status_id = @job.status_id

    tracker_task = TrackerTask.find_by(name: "Pricing Created")


    respond_to do |format|
      if @pricing.save
        @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @pricing.id, user_id: current_user.id)
        format.html { redirect_to @job, notice: 'Pricing was successfully created.' }
        format.json { render :show, status: :created, location: @pricing }
      else
        format.html { render :new }
        format.json { render json: @pricing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pricings/1
  # PATCH/PUT /pricings/1.json
  def update
    respond_to do |format|
      if @pricing.update(pricing_params)
        format.html { redirect_to @pricing, notice: 'Pricing was successfully updated.' }
        format.json { render :show, status: :ok, location: @pricing }
      else
        format.html { render :edit }
        format.json { render json: @pricing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pricings/1
  # DELETE /pricings/1.json
  def destroy
    @pricing.destroy
    respond_to do |format|
      format.html { redirect_to pricings_url, notice: 'Pricing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pricing
      @pricing = Pricing.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pricing_params
      params.require(:pricing).permit(:price, :pricing_category_id, :description, uploads_attributes: [:upload_category_id, :description, {uploads: []}])
    end
end
