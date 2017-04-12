class SchedulersController < ApplicationController
  before_action :set_scheduler, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /scheduler
  # GET /scheduler.json
  def index
    @schedulers = Scheduler.all
  end

  # GET /scheduler/1
  # GET /scheduler/1.json
  def show
  end

  # GET /scheduler/new
  def new
    @scheduler = Scheduler.new
  end

  # GET /scheduler/1/edit
  def edit
  end

  # POST /scheduler
  # POST /scheduler.json
  def create
    @scheduler = Scheduler.new(scheduler_params)
    @scheduler.job_id = @job.id

    respond_to do |format|
      if @scheduler.save
        format.html { redirect_to job_scheduler_path(@job, @scheduler), notice: 'Scheduler was successfully created.' }
        format.json { render :show, status: :created, location: @scheduler }
      else
        format.html { render :new }
        format.json { render json: @scheduler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduler/1
  # PATCH/PUT /scheduler/1.json
  def update
    respond_to do |format|
      if @scheduler.update(scheduler_params)
        format.html { redirect_to job_scheduler_path(@job, @scheduler), notice: 'Scheduler was successfully updated.' }
        format.json { render :show, status: :ok, location: @scheduler }
      else
        format.html { render :edit }
        format.json { render json: @scheduler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduler/1
  # DELETE /scheduler/1.json
  def destroy
    @scheduler.destroy
    respond_to do |format|
      format.html { redirect_to job_schedulers_path(@job), notice: 'Scheduler was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduler
      @scheduler = Scheduler.find(params[:id])
    end

    def set_job
      @job  = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduler_params
      params.require(:scheduler).permit(:event_date, :start_time, :end_time, :assigned_to_user_id, :job_id, :scheduler_event_type_id, :notes, :title)
    end
end
