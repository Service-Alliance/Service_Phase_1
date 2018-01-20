class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]

  # GET /tracker
  # GET /tracker.json
  def index
    @trackers = Tracker.all
  end

  # GET /tracker/1
  # GET /tracker/1.json
  def show
  end

  # GET /tracker/new
  def new
    @tracker = Tracker.new
  end

  # GET /tracker/1/edit
  def edit
  end

  # POST /tracker
  # POST /tracker.json
  def create
    @tracker = Tracker.new(tracker_params)
    @tracker.job_id = @job.id

    respond_to do |format|
      if @tracker.save
        @job.track 'Tracker Created', current_user, @tracker
        format.html { redirect_to job_path(@job), notice: 'Tracker was successfully created.' }
        format.json { render :show, status: :created, location: @tracker }
      else
        format.html { redirect_to job_path(@job), errors: @tracker.errors }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracker/1
  # PATCH/PUT /tracker/1.json
  def update
    respond_to do |format|
      if @tracker.update(tracker_params)
        format.html { redirect_to job_tracker_path(@job, @tracker), notice: 'Tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker }
      else
        format.html { render :edit }
        format.json { render json: @tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracker/1
  # DELETE /tracker/1.json
  def destroy
    @tracker.destroy
    respond_to do |format|
      if params[:job_id]
        @job = Job.find(params[:job_id])
        format.html { redirect_to job_path(@job), notice: 'Tracker was successfully destroyed.' }
        format.json { head :no_content }
      end
      if params[:customer_id]
        @customer = Customer.find(params[:customer_id])
        format.html { redirect_to customer_path(@customer), notice: 'Tracker was successfully destroyed.' }
        format.json { head :no_content }
      end
      if params[:franchise_id]
        @franchise = Franchise.find(params[:franchise_id])
        format.html { redirect_to franchise_path(@franchise), notice: 'Tracker was successfully destroyed.' }
        format.json { head :no_content }
      end
      if params[:insurance_company_id]
        @insurance_company = InsuranceCompany.find(params[:insurance_company_id])
        format.html { redirect_to insurance_company_path(@insurance_company), notice: 'Tracker was successfully destroyed.' }
        format.json { head :no_content }
      end
      if params[:vendor_id]
        @vendor = Vendor.find(params[:vendor_id])
        format.html { redirect_to vendor_path(@vendor), notice: 'Tracker was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_params
      params.require(:tracker).permit(:trackable_id, :trackable_type)
    end
end
