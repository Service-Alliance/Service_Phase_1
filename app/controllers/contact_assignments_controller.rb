class ContactAssignmentsController < ApplicationController
  before_action :set_contact_assignment, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /contact_assignments
  # GET /contact_assignments.json
  def index
    @contact_assignments = ContactAssignment.all
  end

  # GET /contact_assignments/1
  # GET /contact_assignments/1.json
  def show
  end

  # GET /contact_assignments/new
  def new
    @contact_assignment = ContactAssignment.new
  end

  # GET /contact_assignments/1/edit
  def edit
  end

  # POST /contact_assignments
  # POST /contact_assignments.json
  def create
    @contact_assignment = ContactAssignment.new(contact_assignment_params)
    @contact_assignment.job_id = @job.id

    respond_to do |format|
      if @contact_assignment.contact_id && @contact_assignment.save
        format.html { redirect_to job_contact_assignments_path(@job), notice: 'Contact assignment was successfully created.' }
        format.json { render :show, status: :created, location: @contact_assignment }
      else
        format.html { render :new }
        format.json { render json: @contact_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_assignments/1
  # PATCH/PUT /contact_assignments/1.json
  def update
    respond_to do |format|
      if @contact_assignment.update(contact_assignment_params)
        format.html { redirect_to job_contact_assignments_path(@job), notice: 'Contact assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_assignment }
      else
        format.html { render :edit }
        format.json { render json: @contact_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_assignments/1
  # DELETE /contact_assignments/1.json
  def destroy
    @contact_assignment.destroy
    respond_to do |format|
      format.html { redirect_to job_contact_assignments_url, notice: 'Contact assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_assignment
      @contact_assignment = ContactAssignment.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_assignment_params
      params.require(:contact_assignment).permit(:contact_id, :job_id, :note)
    end
end
