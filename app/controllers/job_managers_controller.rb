class JobManagersController < ApplicationController
  before_action :set_job_manager, only: [:show, :edit, :update, :destroy, :acknolwedge]
  before_action :set_job, except: [:list]

  # GET /job_managers
  # GET /job_managers.json
  def index
    @job_managers = JobManager.where(job_id: @job.id)
  end

  # GET /job_managers/1
  # GET /job_managers/1.json
  def show
  end

  # GET /job_managers/new
  def new
    @job_manager = JobManager.new
  end

  # GET /job_managers/1/edit
  def edit
  end

  # POST /job_managers
  # POST /job_managers.json
  def create
    @job_manager = JobManager.new(job_manager_params)
    @job_manager.job_id = @job.id

    respond_to do |format|
      if @job_manager.job_manager_id && @job_manager.save
        @job.update_last_action
        @user = @job_manager.job_manager
        if @user.email
          UserMailer.manager_assignment(@user, @job_manager).deliver_now
        end
        format.html { redirect_to job_job_managers_path(@job), notice: 'Job manager was successfully created.' }
        format.json { render :show, status: :created, location: @job_manager }
      else
        format.html { render :new }
        format.json { render json: @job_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_managers/1
  # PATCH/PUT /job_managers/1.json
  def update
    respond_to do |format|
      if @job_manager.update(job_manager_params)
        @job.update_last_action
        @user = @job_manager.job_manager
        if @user.email
          UserMailer.manager_assignment(@user, @job_manager).deliver_now
        end
        format.html { redirect_to job_job_managers_path(@job), notice: 'Job manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_manager }
      else
        format.html { render :edit }
        format.json { render json: @job_manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_managers/1
  # DELETE /job_managers/1.json
  def destroy
    @job_manager.destroy
    respond_to do |format|
      format.html { redirect_to job_managers_url, notice: 'Job manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def acknolwedge
    @job_manager.manager_confirmation = true
    @job_manager.save
    redirect_to job_path(@job), notice: 'Job acknolwedged.'
  end

  def list
    @job_managers = JobManager.last(200)
    render json: @job_managers.to_json(include: :job_manager)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_manager
      @job_manager = JobManager.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_manager_params
      params.require(:job_manager).permit(:job_manager_id, :schedule_date, :start_time, :end_time, :note)
    end
end
