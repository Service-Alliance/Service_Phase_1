class AgentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_agent, only: [:show, :edit, :update, :destroy]
  # before_action :set_job, except: [:lookup]

  # GET /agents
  # GET /agents.json
  def index
    @agents = Agent.all
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    @address = Address.find_by(id: @agent.address_id)
    @job = Job.find_by(id: params[:job_id])
  end

  # GET /agents/new
  def new
    @agent = Agent.new
    @address = Address.new
    @phones = nil
    @job = Job.find_by(id: params[:job_id])
  end

  # GET /agents/1/edit
  def edit
    @job = Job.find_by(id: params[:job_id])
    @address = Address.find_by(id: @agent.address_id) || @address = Address.new
    @phones = @agent.phones
  end

  # POST /agents
  # POST /agents.json
  def create
    @job = Job.find_by(id: job_params[:job_id])
    if same_agent_params[:agent_id] != ''
      @agent = Agent.find(same_agent_params[:agent_id])
      @job.agent_id = same_agent_params[:agent_id]
      @job.last_action = Date.today
      @job.save

      return redirect_to agent_path(@agent, job_id: @job.id), notice: 'Agent was successfully assigned.'
    else
      @agent = Agent.new(agent_params)
      @address = Address.new(address_params)



      respond_to do |format|
        @address.save
        @agent.address_id = @address.id
        if @agent.save
          @agent.phones.destroy_all
          phone_count = phone_params["type_ids"].count

          phone_count.times do |index|
            unless phone_params["numbers"][index] == ""
              @agent.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
          end
          @job.agent_id = @agent.id
          @job.save
          format.html { redirect_to agent_path(@agent, job_id: @job.id), notice: 'Agent was successfully created.' }
          format.json { render :show, status: :created, location: @agent }
        else
          format.html { render :new }
          format.json { render json: @agent.errors, status: :unprocessable_entity }
        end
      end
  end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    @job = Job.find_by(id: job_params[:job_id])
    respond_to do |format|
      @agent.phones.destroy_all
      phone_count = phone_params["type_ids"].count

      phone_count.times do |index|
        unless phone_params["numbers"][index] == ""
          @agent.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
        end
      end

      if @agent.update(agent_params)
        @agent.address.update(address_params)
        @job.last_action = Date.today
        @job.save

        format.html { redirect_to agent_path(@agent, job_id: @job.id), notice: 'Agent was successfully updated.' }
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
    @agent.phones.destroy_all
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

    redirect_to job_path(@job), notice: 'Agent was successfully replicated from caller.'
  end

  def remove_from_job
    @job = Job.find(params[:job_id])
    @job.agent_id = nil
    @job.save
    redirect_to job_path(@job), notice: 'Agent was successfully removed from job.'
  end

  def lookup
    if request.xhr?
      @agent = Agent.find_by(id: params[:data])
      @address = Address.find_by(id: @agent.address_id)
      @phones = @agent.phones
      render json: [@agent, @address, @phones]
    end
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
    params.require(:agent).permit(:job_id, :first_name, :last_name, :email,
                                  :address_id, :agent_id, :insurance_company_id)
  end

  def address_params
    params.require(:address).permit(:address_1, :address_2, :zip_code, :city, :state_id, :county)
  end

  def job_params
    params.require(:job).permit(:job_id)
  end

  def same_agent_params
    params.require(:same_agent).permit(:agent_id)
  end

  def phone_params
    params.require(:phones).permit(numbers:[], extensions:[], type_ids:[])
  end
end
