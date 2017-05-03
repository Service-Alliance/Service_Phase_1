class OncallsController < ApplicationController
  before_action :set_oncall, only: [:show, :edit, :update, :destroy]

  # GET /oncalls
  # GET /oncalls.json
  def index
    if params[:date]
      @date = params[:date]
      @oncalls = Oncall.where(scheduled_on: params[:date])
      render :day_show, oncalls: @oncalls
    else
      @oncalls = Oncall.all
    end
  end

  # GET /oncalls/1
  # GET /oncalls/1.json
  def show
  end

  # GET /oncalls/new
  def new
    @oncall = Oncall.new
  end

  # GET /oncalls/1/edit
  def edit
  end

  # POST /oncalls
  # POST /oncalls.json
  def create
    Oncall.load_oncalls(oncall_params)
    respond_to do |format|
        format.html { redirect_to oncalls_path, notice: 'Oncall was successfully created.' }
        format.json { render :show, status: :created, location: @oncall }
    end
  end

  # PATCH/PUT /oncalls/1
  # PATCH/PUT /oncalls/1.json
  def update
    respond_to do |format|
      if @oncall.update(oncall_params)
        format.html { redirect_to @oncall, notice: 'Oncall was successfully updated.' }
        format.json { render :show, status: :ok, location: @oncall }
      else
        format.html { render :edit }
        format.json { render json: @oncall.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    params[:oncall].each_with_index do |id, index|
      Oncall.where(id: id).update_all({priority: index+1})
    end
    render :ok
  end

  # DELETE /oncalls/1
  # DELETE /oncalls/1.json
  def destroy
    @oncall.destroy
    respond_to do |format|
      format.html { redirect_to oncalls_url, notice: 'Oncall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oncall
      @oncall = Oncall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oncall_params
      params.require(:oncall).permit(:scheduled_on, user_ids: [], priorities: [])
    end
end
