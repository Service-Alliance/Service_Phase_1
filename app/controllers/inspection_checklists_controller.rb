class InspectionChecklistsController < ApplicationController
  before_action :set_inpsection_checklist, only: [:show, :edit, :update, :destroy]
  before_action :set_job
  # GET /inspection_checklists
  # GET /inspection_checklists.json
  def index
    @inspection_checklists = InspectionChecklist.all
  end

  # GET /inspection_checklists/1
  # GET /inspection_checklists/1.json
  def show
  end

  # GET /inspection_checklists/new
  def new
    @inpsection_checklist = InspectionChecklist.new
  end

  # GET /inspection_checklists/1/edit
  def edit
  end

  # POST /inspection_checklists
  # POST /inspection_checklists.json
  def create
    @inpsection_checklist = InspectionChecklist.new(inspection_checklist_params)
    @inpsection_checklist.job_id = @job.id

    respond_to do |format|
      if @inpsection_checklist.save
        @job.track('Inspection Checklist Created', current_user, @inspection_checklist)

        format.html { redirect_to job_path(@job), notice: 'InspectionChecklist was successfully created.' }
        format.json { render :show, status: :created, location: @inpsection_checklist }
      else
        format.html { render :new }
        format.json { render json: @inpsection_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inspection_checklists/1
  # PATCH/PUT /inspection_checklists/1.json
  def update
    respond_to do |format|
      if @inpsection_checklist.update(inspection_checklist_params)
        format.html { redirect_to job_inpsection_checklist_path(@job, @inpsection_checklist), notice: 'InspectionChecklist was successfully updated.' }
        format.json { render :show, status: :ok, location: @inpsection_checklist }
      else
        format.html { render :edit }
        format.json { render json: @inpsection_checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inspection_checklists/1
  # DELETE /inspection_checklists/1.json
  def destroy
    @inpsection_checklist.destroy
    respond_to do |format|
      format.html { redirect_to job_inspection_checklists_url, notice: 'InspectionChecklist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inpsection_checklist
      @inpsection_checklist = InspectionChecklist.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inspection_checklist_params
      params.require(:inspection_checklist).permit(:estimate_will_be_sent, :estimate_given_verbally, :estimate_range, :notes, :next_steps, :send_within_one_day, :additional_vendor, :verify_information, :potential_construction)
    end
end
