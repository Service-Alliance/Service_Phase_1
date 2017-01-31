class TicsheetsController < ApplicationController
  before_action :set_ticsheet, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /ticsheets
  # GET /ticsheets.json
  def index
    @ticsheets = Ticsheet.all
  end

  # GET /ticsheets/1
  # GET /ticsheets/1.json
  def show
  end

  # GET /ticsheets/new
  def new
    @ticsheet = Ticsheet.new
  end

  # GET /ticsheets/1/edit
  def edit
  end

  # POST /ticsheets
  # POST /ticsheets.json
  def create
    ticsheet_params["key_code"].count.times do |index|
      Ticsheet.create(key_code: ticsheet_params['key_code'][index], description: ticsheet_params['description'][index], uom: ticsheet_params['uom'][index], percentage: ticsheet_params['percentage'][index], quantity: ticsheet_params['quantity'][index])
    end
    respond_to do |format|
      # if @ticsheet.save
        format.html { redirect_to @ticsheet, notice: 'Ticsheet was successfully created.' }
        format.json { render :show, status: :created, location: @ticsheet }
      # else
      #   format.html { render :new }
      #   format.json { render json: @ticsheet.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /ticsheets/1
  # PATCH/PUT /ticsheets/1.json
  def update
    respond_to do |format|
      if @ticsheet.update(ticsheet_params)
        format.html { redirect_to @ticsheet, notice: 'Ticsheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticsheet }
      else
        format.html { render :edit }
        format.json { render json: @ticsheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticsheets/1
  # DELETE /ticsheets/1.json
  def destroy
    @ticsheet.destroy
    respond_to do |format|
      format.html { redirect_to ticsheets_url, notice: 'Ticsheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticsheet
      @ticsheet = Ticsheet.find(params[:id])
    end

    def set_job
      @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticsheet_params
      params.require(:ticsheet).permit(key_code:[], description:[], uom:[], percentage:[], quantity:[])
    end
end
