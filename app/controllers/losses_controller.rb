class LossesController < ApplicationController
  before_action :set_loss, only: [:show, :edit, :update, :destroy]
  before_action :set_job
  # GET /losses
  # GET /losses.json
  def index
    @losses = Loss.all
  end

  # GET /losses/1
  # GET /losses/1.json
  def show
  end

  # GET /losses/new
  def new
    @loss = Loss.new
  end

  # GET /losses/1/edit
  def edit
  end

  # POST /losses
  # POST /losses.json
  def create
    @loss = Loss.new(loss_params)
    @loss.job_id = @job.id
    if loss_params['fnol_received']
      @job.fnol_received = loss_params['fnol_received']
      @job.save
    end

    respond_to do |format|
      if @loss.save
        @job.update_last_action
        format.html { redirect_to job_loss_path(@job, @loss), notice: 'Loss was successfully created.' }
        format.json { render :show, status: :created, location: @loss }
      else
        format.html { render :new }
        format.json { render json: @loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /losses/1
  # PATCH/PUT /losses/1.json
  def update
    if loss_params['fnol_received']
      @job.fnol_received = loss_params['fnol_received']
      @job.save
    end
    respond_to do |format|
      if @loss.update(loss_params)
        @job.update_last_action
        format.html { redirect_to job_loss_path(@job, @loss), notice: 'Loss was successfully updated.' }
        format.json { render :show, status: :ok, location: @loss }
      else
        format.html { render :edit }
        format.json { render json: @loss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /losses/1
  # DELETE /losses/1.json
  def destroy
    @loss.destroy
    respond_to do |format|
      format.html { redirect_to job_losses_url, notice: 'Loss was successfully destroyed.' }
      format.json { head :no_content }
  end
end

  def selected_loss_type
    if request.xhr?
      @loss_type = LossType.find(params[:loss_type])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loss
      @loss = Loss.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loss_params
      params.require(:loss).permit(:received_by, :loss_occurred, :fnol_received, :customer_called, :loss_type_id, :loss_cause_id, :standing_water_id, :water_available_id, :electricity_available_id, :source_off_id, :visible_mold_id, :affected_square_footage, :cleaning_type, :previous_water_damage_id, :source_cause, :notes)
    end
end
