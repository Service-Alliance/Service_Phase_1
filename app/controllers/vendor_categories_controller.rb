class VendorCategoriesController < ApplicationController
  before_action :set_vendor_category, only: [:show, :edit, :update, :destroy]

  # GET /vendor_categories
  # GET /vendor_categories.json
  def index
    @vendor_categories = VendorCategory.all
  end

  # GET /vendor_categories/1
  # GET /vendor_categories/1.json
  def show
  end

  # GET /vendor_categories/new
  def new
    @vendor_category = VendorCategory.new
  end

  # GET /vendor_categories/1/edit
  def edit
  end

  # POST /vendor_categories
  # POST /vendor_categories.json
  def create
    @vendor_category = VendorCategory.new(vendor_category_params)

    respond_to do |format|
      if @vendor_category.save
        format.html { redirect_to @vendor_category, notice: 'Vendor category was successfully created.' }
        format.json { render :show, status: :created, location: @vendor_category }
      else
        format.html { render :new }
        format.json { render json: @vendor_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendor_categories/1
  # PATCH/PUT /vendor_categories/1.json
  def update
    respond_to do |format|
      if @vendor_category.update(vendor_category_params)
        format.html { redirect_to @vendor_category, notice: 'Vendor category was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor_category }
      else
        format.html { render :edit }
        format.json { render json: @vendor_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_categories/1
  # DELETE /vendor_categories/1.json
  def destroy
    @vendor_category.destroy
    respond_to do |format|
      format.html { redirect_to vendor_categories_url, notice: 'Vendor category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_category
      @vendor_category = VendorCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_category_params
      params.require(:vendor_category).permit(:name)
    end
end
