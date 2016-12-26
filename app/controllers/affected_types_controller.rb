class AffectedTypesController < ApplicationController
  before_action :set_affected_type, only: [:show, :edit, :update, :destroy]

  # GET /affected_types
  # GET /affected_types.json
  def index
    @affected_types = AffectedType.all
  end

  # GET /affected_types/1
  # GET /affected_types/1.json
  def show
  end

  # GET /affected_types/new
  def new
    @affected_type = AffectedType.new
  end

  # GET /affected_types/1/edit
  def edit
  end

  # POST /affected_types
  # POST /affected_types.json
  def create
    @affected_type = AffectedType.new(affected_type_params)

    respond_to do |format|
      if @affected_type.save
        format.html { redirect_to @affected_type, notice: 'Affected type was successfully created.' }
        format.json { render :show, status: :created, location: @affected_type }
      else
        format.html { render :new }
        format.json { render json: @affected_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affected_types/1
  # PATCH/PUT /affected_types/1.json
  def update
    respond_to do |format|
      if @affected_type.update(affected_type_params)
        format.html { redirect_to @affected_type, notice: 'Affected type was successfully updated.' }
        format.json { render :show, status: :ok, location: @affected_type }
      else
        format.html { render :edit }
        format.json { render json: @affected_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affected_types/1
  # DELETE /affected_types/1.json
  def destroy
    @affected_type.destroy
    respond_to do |format|
      format.html { redirect_to affected_types_url, notice: 'Affected type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affected_type
      @affected_type = AffectedType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affected_type_params
      params.require(:affected_type).permit(:name)
    end
end
