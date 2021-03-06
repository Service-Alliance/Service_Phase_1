class VendorAssignmentsController < ApplicationController
  before_action :set_vendor_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /vendor_assignments
  # GET /vendor_assignments.json
  def index
  end

  # GET /vendor_assignments/1
  # GET /vendor_assignments/1.json
  def show
  end

  # GET /vendor_assignments/new
  def new
    @vendor_assignment = VendorAssignment.new
  end

  # GET /vendor_assignments/1/edit
  def edit
  end

  # POST /vendor_assignments
  # POST /vendor_assignments.json
  def create
    @vendor_assignment = VendorAssignment.new(vendor_assignment_params)
    @vendor_assignment.job_id = @job.id

    respond_to do |format|
      if @vendor_assignment.vendor_id && @vendor_assignment.save
        format.html { redirect_to @job, notice: 'Vendor assigment was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_assignment }
      else
        format.html { render :new }
        format.json { render json: @vendor_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_assignments/1
  # PATCH/PUT /vendor_assignments/1.json
  def update
    respond_to do |format|
      if @vendor_assignment.update(vendor_assignment_params)
        format.html { redirect_to job_vendor_assignment_path(@job), notice: 'Vendor assigment was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_assignment }
      else
        format.html { render :edit }
        format.json { render json: @vendor_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_assignments/1
  # DELETE /vendor_assignments/1.json
  def destroy
    @vendor_assignment.destroy
    respond_to do |format|
      format.html { redirect_to vendor_assignments_url, notice: 'Vendor assigment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_assignment
      @vendor_assignment = VendorAssignment.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_assignment_params
      params.require(:vendor_assignment).permit(:vendor_id, :note, :assignment_type_id)
    end
end
