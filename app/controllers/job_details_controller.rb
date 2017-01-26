class JobDetailsController < ApplicationController
  before_action :set_job_detail, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /job_details
  # GET /job_details.json
  def index
    @job_details = JobDetail.all
  end

  # GET /job_details/1
  # GET /job_details/1.json
  def show
  end

  # GET /job_details/new
  def new
    @job_detail = JobDetail.new
    @billing_address = Address.new
  end

  # GET /job_details/1/edit
  def edit
    @billing_address = @job_detail.try(:billing_address) || @billing_address = Address.new
  end

  # POST /job_details
  # POST /job_details.json
  def create
    @job_detail = JobDetail.new(job_detail_params)
    @job_detail.job_id = @job.id

    if billing_params != {}
      if billing_params[:type][0] == '1'
        @job_detail.billing_type_id = 1
        @job_detail.billing_address_id = @job.customer.address_id
        @job_detail.billing_address_first_name = @job.customer.first_name
        @job_detail.billing_address_last_name = @job.customer.last_name
      elsif billing_params[:type][0] == '2'
        adjuster = Adjuster.find_by(job_id: @job.id)
        @job_detail.billing_type_id = 2
        @job_detail.billing_address_id = adjuster.address_id
        @job_detail.billing_address_first_name = adjuster.first_name
        @job_detail.billing_address_last_name = adjuster.last_name
      elsif billing_params[:type][0] == '3'
        @job_detail.billing_type_id = 3
        @job_detail.billing_address_first_name = address_params[:first_name]
        @job_detail.billing_address_last_name = address_params[:last_name]
        @billing_address = Address.create(address_1: address_params[:address_1],
                                          address_2:  address_params[:address_2],
                                          city:  address_params[:city],
                                          zip_code: address_params[:zip_code],
                                          county:  address_params[:county])
        @billing_address.save
        @job_detail.billing_address_id = @billing_address.id
        end
      @job.save
    end

    respond_to do |format|
      if @job_detail.save
        format.html {  redirect_to job_job_detail_path(@job, @job_detail), notice: 'Job detail was successfully created.' }
        format.json { render :show, status: :created, location: @job_detail }
      else
        format.html { render :new }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_details/1
  # PATCH/PUT /job_details/1.json
  def update
    if billing_params != {}
      if billing_params[:type][0] == '1'
        @job_detail.billing_type_id = 1
        @job_detail.billing_address_id = @job.customer.address_id
        @job_detail.billing_address_first_name = @job.customer.first_name
        @job_detail.billing_address_last_name = @job.customer.last_name
      elsif billing_params[:type][0] == '2'
        adjuster = Adjuster.find_by(job_id: @job.id)
        @job_detail.billing_type_id = 2
        @job_detail.billing_address_id = adjuster.address_id
        @job_detail.billing_address_first_name = adjuster.first_name
        @job_detail.billing_address_last_name = adjuster.last_name
      elsif billing_params[:type][0] == '3'
        @job_detail.billing_type_id = 3
        @job_detail.billing_address_first_name = address_params[:first_name]
        @job_detail.billing_address_last_name = address_params[:last_name]
        @billing_address = Address.create(address_1: address_params[:address_1],
                                          address_2:  address_params[:address_2],
                                          city:  address_params[:city],
                                          zip_code: address_params[:zip_code],
                                          county:  address_params[:county])
        @billing_address.save
        @job_detail.billing_address_id = @billing_address.id
        end
      @job_detail.save

      return redirect_to @job, notice: 'Job was successfully updated.'
    end
    respond_to do |format|
      if @job_detail.update(job_detail_params)
        format.html { redirect_to job_job_detail_path(@job, @job_detail), notice: 'Job detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_detail }
      else
        format.html { render :edit }
        format.json { render json: @job_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_details/1
  # DELETE /job_details/1.json
  def destroy
    @job_detail.destroy
    respond_to do |format|
      format.html { redirect_to job_details_url, notice: 'Job detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_detail
      @job_detail = JobDetail.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_detail_params
      params.require(:job_detail).permit(:insurance_company_id, :claim_number, :policy_number, :coverage_type_id, :deductible_amount, :self_pay_id, :deductible_id, :esl_nst_amount_id, :emergency_service_amount, :job_id, :billing_type_id)
    end
    def address_params
      params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city,
                                        :state_id, :county, :first_name, :last_name)
    end
    def billing_params
      params.fetch(:billing_address, {}).permit(type: [])
    end
end
