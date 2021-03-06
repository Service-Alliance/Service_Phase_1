class CallsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:precall, :postcall]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all
  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)

    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def precall_lookup
    if request.xhr?
      @id = Call.find_by(id: params[:id])

      render json: @id
    end
  end

  def precall
    Call.precall_parse(params)
    head :no_content
  end

  def postcall
    Call.postcall_parse(params)
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_call
    @call = Call.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def call_params
    params.require(:call).permit(:callrail_id, :callsource, :datetime, :trackingnum, :customer_phone_number, :destinationnum, :customer_name, :customer_city, :customer_state, :customer_zip, :customer_country, :keywords, :referrer, :referrermedium, :landingpage, :last_requested_url, :gclid, :ip, :utm_source, :utm_medium, :utm_term, :utm_content, :utm_campaign, :utma, :utmb, :utmv, :utmz, :utmx, :ga, :first_call, :recording, :duration, :answered, :user_id, :job_id, :inprogress, :franchise_id, :vendor_id, :duration)
  end
end
