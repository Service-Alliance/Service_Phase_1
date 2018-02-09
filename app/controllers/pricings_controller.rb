class PricingsController < ApplicationController
  before_action :set_pricing, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # FIXME: Can we delete this controller? Seems like it's not used...

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
    @pricing = @job.pricings.build
    @pricing.uploads.build
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
    else
      @category_id = 3
    end

    @new_pricing = Pricing.create(job_id: @job.id, current_status_id: @job.status_id, pricing_category_id: @category_id, description: "Moved to next category" )

    @job.track 'Pricing Created', current_user, @new_pricing
    redirect_to @job, notice: 'Pricing was successfully created.'
  end

  # POST /pricings
  # POST /pricings.json
  def create
    @pricing = Pricing.new(pricing_params)
    @pricing.job_id = @job.id
    @pricing.current_status_id = @job.status_id

    respond_to do |format|
      if @pricing.save
        @job.track 'Pricing Created', current_user, @pricing
        JobMailer.pricing_created(@job.job_coordinator, current_user, @pricing, @job).deliver if @job.job_coordinator.present?
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
      format.html { redirect_to job_pricings_url(params[:job_id]), notice: 'Pricing was successfully destroyed.' }
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
      params.require(:pricing).permit(
        :non_taxable_amount,
        :taxable_amount,
        :tax_amount,
        :pricing_category_id,
        :description,
        uploads_attributes: [:upload_category_id, :description, {uploads: []}])
    end
end
