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
    tracker_task = TrackerTask.find_by(name: "Tracker Created")

    respond_to do |format|
      if @tracker.save
        @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @tracker.id, user_id: current_user.id)
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
