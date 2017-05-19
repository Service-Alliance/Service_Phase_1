class FranchisesController < ApplicationController
  before_action :set_franchise, only: [:show, :edit, :update, :destroy]

  # GET /franchises
  # GET /franchises.json
  def index
    @franchises = Franchise.all
  end

  # GET /franchises/1
  # GET /franchises/1.json
  def show
    @address = Address.find_by(id: @franchise.address_id)
  end

  # GET /franchises/new
  def new
    @franchise = Franchise.new
     @address = Address.new
  end

  # GET /franchises/1/edit
  def edit
    @address = Address.find_by(id: @franchise.address_id) || @address = Address.new
  end

  # POST /franchises
  # POST /franchises.json
  def create
    @franchise = Franchise.new(franchise_params)
    @address = Address.new(address_params)
    @franchise.address_id = @address.id

    respond_to do |format|
      if @franchise.save
        format.html { redirect_to @franchise, notice: 'Franchise was successfully created.' }
        format.json { render :show, status: :created, location: @franchise }
      else
        format.html { render :new }
        format.json { render json: @franchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchises/1
  # PATCH/PUT /franchises/1.json
  def update
    if @franchise.address
      @franchise.address.update(address_params) unless address_params.empty?
    else
      @address = Address.create(address_params)
      @franchise.address_id = @address.id
      @franchise.save
    end

    respond_to do |format|
      if @franchise.update(franchise_params)
        if franchise_params[:notes_attributes]
          @note = @franchise.notes.last
          tracker_task = TrackerTask.find_by(name: "Note Created")
          @franchise.trackers.create(tracker_task_id: tracker_task.id, child_id: @note.id)
        end
        if franchise_params[:uploads_attributes]
          @upload = @franchise.uploads.last
          tracker_task = TrackerTask.find_by(name: "File Uploaded")
          @franchise.trackers.create(tracker_task_id: tracker_task.id, child_id: @upload.id)
        end
        format.html { redirect_to @franchise, notice: 'Franchise was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchise }
      else
        format.html { render :edit }
        format.json { render json: @franchise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchises/1
  # DELETE /franchises/1.json
  def destroy
    @franchise.destroy
    respond_to do |format|
      format.html { redirect_to franchises_url, notice: 'Franchise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchise
      @franchise = Franchise.find(params[:id])
    end

    def address_params
      params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchise_params
      params.require(:franchise).permit(:name, :franchise_number, :legal_name, :phone, :fax, :website, :general_license, :residential_license, :commercial_license, :mold_remediation_license, uploads_attributes: [:upload_category_id, :description, {uploads: []}], notes_attributes: [:content])
    end
end
