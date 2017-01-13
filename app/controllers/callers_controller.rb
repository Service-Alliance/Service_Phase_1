class CallersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_caller, only: [:show, :edit, :update, :destroy]
  before_action :set_job
  # GET /callers
  # GET /callers.json
  def index
    @callers = Caller.all
  end

  # GET /callers/1
  # GET /callers/1.json
  def show
    @address = Address.find_by(id: @caller.address_id)
  end

  # GET /callers/new
  def new
    @caller = Caller.new
    @phone = Phone.new
    @address = Address.new
  end

  # GET /callers/1/edit
  def edit
    @address = Address.find_by(id: @caller.address_id) || @address = Address.new
    @phone = Phone.find_by(caller_id: @caller.id) || @phone = Phone.new
  end

  # POST /callers
  # POST /callers.json
  def create
    @caller = Caller.new(caller_params)
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @caller.save
        @phone.caller_id = @caller.id
        @phone.save
        format.html { redirect_to job_path(@job), notice: 'Caller was successfully created.' }
        format.json { render :show, status: :created, location: @caller }
      else
        format.html { render :new }
        format.json { render json: @caller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /callers/1
  # PATCH/PUT /callers/1.json
  def update
    respond_to do |format|
      @phone = Phone.find_by(caller_id: @caller.id)
      @phone.update(phone_params)
      if @caller.update(caller_params)
        format.html { redirect_to job_path(@job), notice: 'Caller was successfully updated.' }
        format.json { render :show, status: :ok, location: @caller }
      else
        format.html { render :edit }
        format.json { render json: @caller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /callers/1
  # DELETE /callers/1.json
  def destroy
    @caller.destroy
    respond_to do |format|
      format.html { redirect_to callers_url, notice: 'Caller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_caller
    @caller = Caller.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def caller_params
    params.require(:caller).permit(:first_name, :last_name, :email,
                                   :address_id, :job_id)
  end

  def address_params
    params.require(:address).permit(:address_1, :address_2, :zip_code, :city,
                                    :state_id, :county)
  end

  def phone_params
    params.require(:phone).permit(:number, :extension, :type_id)
  end
end
