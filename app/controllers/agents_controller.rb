class AgentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agent, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    @address = Address.find_by(id: @agent.address_id)
  end

  # GET /agents/new
  def new
    @agent = Agent.new
    @address = Address.new
    @phone = Phone.new
  end

  # GET /agents/1/edit
  def edit
    @address = Address.find_by(id: @agent.address_id) || @address = Address.new

    @phone = Phone.find_by(agent_id: @agent.id) || @phone = Phone.new
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)
    @address = Address.new(address_params)
    @phone = Phone.new(phone_params)

    respond_to do |format|
      @address.save
      @agent.address_id = @address.id
      @agent.job_id = @job.id

      if @agent.save
        @phone.agent_id = @agent.id
        @phone.save
        format.html { redirect_to job_path(@job), notice: 'Agent was successfully created.' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        @agent.address.update(address_params)
        @phone = Phone.find_by(agent_id: @agent.id)
        @phone.update(phone_params)
        format.html { redirect_to job_path(@job), notice: 'Agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def samecaller
    @job = Job.find_by(id: params[:job_id])
    @caller = Caller.find_by(job_id: @job.id)
    @caller_phone = Phone.find_by(caller_id: @caller.id)

    @caller_address = Address.find_by(id: @caller.address_id)

    @address = Address.new(address_1: @caller_address.address_1, address_2: @caller_address.address_2, zip_code: @caller_address.zip_code, city: @caller_address.city, county: @caller_address.county, state_id: @caller_address.state_id)

    @address.save

    @agent = Agent.new(first_name: @caller.first_name, last_name: @caller.last_name, email: @caller.email, address_id: @address.id, job_id: @job.id)
    @agent.save

    @phone = Phone.new(number: @caller_phone.number, extension: @caller_phone.extension, agent_id: @agent.id, type_id: @caller_phone.type_id)
    @phone.save

    @job.save

    redirect_to job_path(@job), notice: 'Adjuster was successfully replicated from caller.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    def set_job
        @job = Job.find(params[:job_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:job_id, :first_name, :last_name, :email, :address_id)
    end

    def address_params
        params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
    end

    def phone_params
        params.require(:phone).permit(:number, :extension, :type_id)
    end
end
