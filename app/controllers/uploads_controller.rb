class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = @job.uploads
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  # POST /uploads.json
  def create

    @upload = @job.uploads.new(upload_params)

    tracker_task = TrackerTask.find_by(name: "File Uploaded")

    respond_to do |format|
      if @upload.save
        @job.trackers.create(tracker_task_id: tracker_task.id, child_id: @upload.id, user_id: current_user.id)
        @job.update_last_action
        format.html { redirect_to job_path(@job), notice: 'Upload was successfully uploaded.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { redirect_to job_path(@job) }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        @job.update_last_action
        format.html { redirect_to job_uploads_path(@job), notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to job_path(@job), notice: 'Upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_upload
    @upload = Upload.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def upload_params
    params.require(:upload).permit(:upload, :upload_category_id, {uploads: []})
  end
end
