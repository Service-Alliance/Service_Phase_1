class FranchiseZipcodesController < ApplicationController
  before_action :set_franchise_zipcode, only: [:show, :edit, :update, :destroy]

  # GET /franchise_zipcodes
  # GET /franchise_zipcodes.json
  def index
    @franchise_zipcodes = FranchiseZipcode.includes(:franchise).order('franchises.name, zip_code').all
  end

  # GET /franchise_zipcodes/1
  # GET /franchise_zipcodes/1.json
  def show
  end

  # GET /franchise_zipcodes/new
  def new
    @franchise_zipcode = FranchiseZipcode.new
  end

  # GET /franchise_zipcodes/1/edit
  def edit
  end

  # POST /franchise_zipcodes
  # POST /franchise_zipcodes.json
  def create
    @franchise_zipcode = FranchiseZipcodeForm.call(franchise_zipcode_params)

    respond_to do |format|
      if @franchise_zipcode.save
        format.html { redirect_to @franchise_zipcode, notice: 'Franchise zipcode was successfully created.' }
        format.json { render :show, status: :created, location: @franchise_zipcode }
      else
        format.html { render :new }
        format.json { render json: @franchise_zipcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /franchise_zipcodes/1
  # PATCH/PUT /franchise_zipcodes/1.json
  def update
    respond_to do |format|
      if @franchise_zipcode.update(franchise_zipcode_params)
        format.html { redirect_to @franchise_zipcode, notice: 'Franchise zipcode was successfully updated.' }
        format.json { render :show, status: :ok, location: @franchise_zipcode }
      else
        format.html { render :edit }
        format.json { render json: @franchise_zipcode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /franchise_zipcodes/1
  # DELETE /franchise_zipcodes/1.json
  def destroy
    @franchise_zipcode.destroy
    respond_to do |format|
      format.html { redirect_to franchise_zipcodes_url, notice: 'Franchise zipcode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_franchise_zipcode
      @franchise_zipcode = FranchiseZipcode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def franchise_zipcode_params
      params.require(:franchise_zipcode).permit(:franchise_id, :zip_code, :city, :county, :assigned)
    end
end
