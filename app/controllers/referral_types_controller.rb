class ReferralTypesController < ApplicationController
  before_action :set_referral_type, only: [:show, :edit, :update, :destroy]

  # GET /referral_types
  # GET /referral_types.json
  def index
    @referral_types = ReferralType.root.ordered
  end

  # GET /referral_types/1
  # GET /referral_types/1.json
  def show
  end

  # GET /referral_types/new
  def new
    @referral_type = ReferralType.new
  end

  # GET /referral_types/1/edit
  def edit
  end

  # POST /referral_types
  # POST /referral_types.json
  def create
    @referral_type = ReferralType.new(referral_type_params)

    respond_to do |format|
      if @referral_type.save
        format.html { redirect_to @referral_type, notice: 'Referral type was successfully created.' }
        format.json { render :show, status: :created, location: @referral_type }
      else
        format.html { render :new }
        format.json { render json: @referral_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referral_types/1
  # PATCH/PUT /referral_types/1.json
  def update
    respond_to do |format|
      if @referral_type.update(referral_type_params)
        format.html { redirect_to @referral_type, notice: 'Referral type was successfully updated.' }
        format.json { render :show, status: :ok, location: @referral_type }
      else
        format.html { render :edit }
        format.json { render json: @referral_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referral_types/1
  # DELETE /referral_types/1.json
  def destroy
    @referral_type.destroy
    respond_to do |format|
      format.html { redirect_to referral_types_url, notice: 'Referral type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referral_type
      @referral_type = ReferralType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referral_type_params
      params.require(:referral_type).permit(
        :id,
        :_destroy,
        :name,
        :referral_type_id,
        :associated_record_type,
        :allows_notes,
        :requires_subtype,
        :requires_associated_record,
        :requires_notes,
        :parent_id,
        sub_types_attributes: [:id, :_destroy, :name]
      )
    end
end
