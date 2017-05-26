class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @search = Company.where.not(name: nil).order('created_at DESC').search(params[:q])
    # @jobs = @search.result
    @companies = @search.result.page(params[:page]).order('created_at DESC')
    @all_results = @search.result
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @address = Address.new
  end

  # GET /companies/1/edit
  def edit
    @address = @company.address ||  @address = Address.new
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    @address = Address.new(address_params)
    @address.save
    @company.address_id = @address.id

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    if company_params[:notes_attributes]
      @note = @company.notes.last
      tracker_task = TrackerTask.find_by(name: "Note Created")
      @company.trackers.create(tracker_task_id: tracker_task.id, child_id: @note.id)
    end
    if company_params[:uploads_attributes]
      @upload = @company.uploads.last
      tracker_task = TrackerTask.find_by(name: "File Uploaded")
      @company.trackers.create(tracker_task_id: tracker_task.id, child_id: @upload.id)
    end
    respond_to do |format|
      @company.address.update(address_params)
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address_id, uploads_attributes: [:upload_category_id, :description, {uploads: []}], notes_attributes: [:content])
    end

    def address_params
      params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city,
                                      :state_id, :county)
    end
end
