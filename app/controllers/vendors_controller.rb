class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @w9 = @vendor.vendor_uploads.where(vendor_upload_type_id: 1).sort_by(&:created_at).last
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        if vendor_params[:notes_attributes]
          @note = @vendor.notes.last
          tracker_task = TrackerTask.find_by(name: "Note Created")
          @vendor.trackers.create(tracker_task_id: tracker_task.id, child_id: @note.id)
        end
        if vendor_params[:uploads_attributes]
          @upload = @vendor.uploads.last
          tracker_task = TrackerTask.find_by(name: "File Uploaded")
          @vendor.trackers.create(tracker_task_id: tracker_task.id, child_id: @upload.id)
        end
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(:category_id, :name, :contact, :phone, :cellphone, :fax, :address, :wc, :liability, :pollution, :auto, :w9, :independent_contractor_agreement, :email, uploads_attributes: [:upload_category_id, :description, {uploads: []}], notes_attributes: [:content])
    end
end
