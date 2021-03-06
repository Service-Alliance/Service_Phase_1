class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]
  before_action :verify_edit_status, only: [:edit, :update, :destroy, :new ]

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @w9 = @vendor.vendor_uploads.where(vendor_upload_type_id: 1).sort_by(&:created_at).last
    @assignments = VendorAssignment.where(vendor_id: @vendor.id).page(params[:page]).order('created_at DESC')
    @work_orders = WorkOrder.where(vendor_id: @vendor.id).page(params[:page]).order('created_at DESC')
    @customers = @vendor.customers
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
        @vendor.track 'Note Created', current_user, @vendor.notes.last if vendor_params[:notes_attributes]
        @vendor.track 'File Uploaded', current_user, @vendor.uploads.last if vendor_params[:uploads_attributes]
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

    def verify_edit_status
      unless Vendor.can_edit?(current_user)
        redirect_to '/vendors', notice: 'You do not have sufficient privileges to complete this action.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(
        :name,
        :contact,
        :phone,
        :cellphone,
        :fax,
        :address,
        :wc,
        :liability,
        :pollution,
        :auto,
        :w9,
        :independent_contractor_agreement,
        :email,
        :supervisor_rate,
        :technician_rate,
        uploads_attributes: [:upload_category_id, :description, {uploads: []}], notes_attributes: [:content],
        loss_rates_attributes: [:id, :loss_type_id, :rate, :_destroy]
      )
    end
end
