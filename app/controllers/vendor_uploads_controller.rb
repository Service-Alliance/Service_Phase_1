class VendorUploadsController < InheritedResources::Base
  before_action :set_vendor
  before_action :set_vendor_upload, only: [:show, :edit, :update, :destroy]

  # GET /vendor_uploads
  # GET /vendor_uploads.json
  def index
    @vendor_uploads = VendorUpload.where(vendor_id: @vendor.id)
  end

  # GET /vendor_uploads/1
  # GET /vendor_uploads/1.json
  def show
  end

  # GET /vendor_uploads/new
  def new
    @vendor_upload = VendorUpload.new
  end

  # GET /vendor_uploads/1/edit
  def edit
  end

  # POST /vendor_uploads
  # POST /vendor_uploads.json
  def create
    @vendor_upload = VendorUpload.new(vendor_id: @vendor.id, vendor_upload_type_id: vendor_upload_params['vendor_upload_type_id'], expiration_date: vendor_upload_params['expiration_date'], name: vendor_upload_params['name'], notes: vendor_upload_params['notes'])


    respond_to do |format|
      if @vendor_upload.save
        p @vendor_upload.uploads.create(upload: vendor_upload_params['upload'])
        format.html { redirect_to vendor_url(@vendor_upload.id), notice: 'Vendor upload was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_upload }
      else
        format.html { render :new }
        format.json { render json: @vendor_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_uploads/1
  # PATCH/PUT /vendor_uploads/1.json
  def update
    respond_to do |format|
      if @vendor_upload.update(vendor_upload_params)
        format.html { redirect_to @vendor, notice: 'Vendor upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_upload }
      else
        format.html { render :edit }
        format.json { render json: @vendor_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_uploads/1
  # DELETE /vendor_uploads/1.json
  def destroy
    @vendor_upload.destroy
    respond_to do |format|
      format.html { redirect_to vendor_vendor_uploads_url, notice: 'Vendor upload was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_upload
      @vendor_upload = VendorUpload.find(params[:id])
    end
    def set_vendor
      @vendor = Vendor.find(params[:vendor_id])
    end
    def vendor_upload_params
      params.require(:vendor_upload).permit(:vendor_id, :upload, :vendor_upload_type_id, :expiration_date, :name, :notes, :upload)
    end
end
