class JobFormsController < ApplicationController
  before_action :set_job_form, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /job_forms
  # GET /job_forms.json
  def index
    @job_forms = JobForm.where(job_id: @job.id)

    @job_authorization = JobForm.find_by(job_id: @job.id, form_id: 1)
  end

  # GET /job_forms/1
  # GET /job_forms/1.json
  def show
    # Check status on load
    if @job_form.signed == false
      if @job_form.check_status == 'COMPLETED'
        @job_form.signed = true
        @job_form.save
      end
    end
  end

  # GET /job_forms/new
  def new
    @job_form = JobForm.new
  end

  # GET /job_forms/1/edit
  def edit
  end

  # POST /job_forms
  # POST /job_forms.json
  def create
    @job_form = JobForm.new(job_form_params)

    respond_to do |format|
      if @job_form.save
        format.html { redirect_to @job_form, notice: 'Job form was successfully created.' }
        format.json { render :show, status: :created, location: @job_form }
      else
        format.html { render :new }
        format.json { render json: @job_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_forms/1
  # PATCH/PUT /job_forms/1.json
  def update
    respond_to do |format|
      if @job_form.update(job_form_params)
        format.html { redirect_to @job_form, notice: 'Job form was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_form }
      else
        format.html { render :edit }
        format.json { render json: @job_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_forms/1
  # DELETE /job_forms/1.json
  def destroy
    @job_form.destroy
    respond_to do |format|
      format.html { redirect_to job_forms_url, notice: 'Job form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_form
    @form = Form.find_by(id: params[:id])

     @job_form = JobForm.create_form(@job, @form)

     redirect_to job_job_form_path(@job, @job_form), notice: 'Job form was successfully created.'
  end

  def download
    @job_form = JobForm.find_by(id: params[:id])
    data = JobForm.download_form(@job_form).parsed_response
    send_data data, filename: "form.pdf", type: "application/pdf", disposition: 'inline', stream: 'true', buffer_size: '4096'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_form
      @job_form = JobForm.find(params[:id])
    end
    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_form_params
      params.require(:job_form).permit(:document_id, :signed, :name, :link)
    end
end
