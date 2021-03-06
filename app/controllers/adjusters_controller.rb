class AdjustersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_adjuster, only: [:show, :edit, :update, :destroy]

  # GET /adjusters
  # GET /adjusters.json
  def index
    @adjusters = Adjuster.all
  end

  # GET /adjusters/1
  # GET /adjusters/1.json
  def show
    @job = Job.find_by(id: params[:job_id])
    @address = Address.find_by(id: @adjuster.address_id)
    @phones = @adjuster.phones
  end

  # GET /adjusters/new
  def new
    @adjuster = Adjuster.new
    @address = Address.new
    @phones = nil
    @job = Job.find_by(id: params[:job_id])
  end

  # GET /adjusters/1/edit
  def edit
    @job = Job.find_by(id: params[:job_id])
    @address = Address.find_by(id: @adjuster.address_id) || @address = Address.new
    @phones = @adjuster.phones
  end

  # POST /adjusters
  # POST /adjusters.json
  def create
    @job = Job.find_by(id: job_params[:job_id])
    if same_adjuster_params[:adjuster_id] != ''
      @job.adjuster_id = same_adjuster_params[:adjuster_id]
      @job.save
      return redirect_to job_path(@job), notice: 'Adjuster was successfully assigned.'
    else
      @adjuster = Adjuster.new(adjuster_params)
      @address = Address.new(address_params)

      respond_to do |format|
        @address.save
        @adjuster.address_id = @address.id
        if @adjuster.save
          @job.adjuster_id = @adjuster.id
          @job.save

          @adjuster.phones.destroy_all
          phone_count = phone_params["type_ids"].count

          phone_count.times do |index|
            unless phone_params["numbers"][index] == ""
              @adjuster.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
            end
          end
          format.html { redirect_to adjuster_path(@adjuster, job_id: @job.id), notice: 'Adjuster was successfully created.' }
          format.json { render :show, status: :created, location: @adjuster }
        else
          format.html { render :new }
          format.json { render json: @adjuster.errors, status: :unprocessable_entity }
        end
      end
  end
  end

  # PATCH/PUT /adjusters/1
  # PATCH/PUT /adjusters/1.json
  def update
    @job = Job.find_by(id: job_params[:job_id])
    p @adjuster
    respond_to do |format|
      if @adjuster.update(adjuster_params)
        if @adjuster.address
          @adjuster.address.update(address_params)
        end
        @adjuster.phones.destroy_all
        phone_count = phone_params["type_ids"].count

        phone_count.times do |index|
          unless phone_params["numbers"][index] == ""
            @adjuster.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
          end
        end

        format.html { redirect_to adjuster_path(@adjuster, job_id: @job.id), notice: 'Adjuster was successfully updated.' }
        format.json { render :show, status: :ok, location: @adjuster }
      else
        format.html { render :edit }
        format.json { render json: @adjuster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adjusters/1
  # DELETE /adjusters/1.json
  def destroy
    @adjuster.destroy
    respond_to do |format|
      format.html { redirect_to adjusters_url, notice: 'Adjuster was successfully destroyed.' }
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

    @adjuster = Adjuster.new(first_name: @caller.first_name, last_name: @caller.last_name, email: @caller.email, address_id: @address.id, job_id: @job.id)
    @adjuster.save

    @phone = Phone.new(number: @caller_phone.number, extension: @caller_phone.extension, adjuster_id: @adjuster.id, type_id: @caller_phone.type_id)
    @phone.save

    @job.save

    redirect_to job_path(@job), notice: 'Adjuster was successfully replicated from caller.'
  end

  def lookup
    if request.xhr?
      @adjuster = Adjuster.find_by(id: params[:data])
      @address = Address.find_by(id: @adjuster.address_id)
      @phones = @adjuster.phones
      render json: [@adjuster, @address, @phones]
    end
  end

  def remove_from_job
    @job = Job.find(params[:job_id])
    @job.adjuster_id = nil
    @job.save
    redirect_to job_path(@job), notice: 'Adjuster was successfully removed from job.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_adjuster
    @adjuster = Adjuster.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def adjuster_params
    params.require(:adjuster).permit(:first_name, :last_name, :email,
                                     :address_id, :adjuster_id, :insurance_company_id)
  end

  def address_params
    params.fetch(:address, {}).permit(:address_1, :address_2, :zip_code, :city,
                                    :state_id, :county)
  end

  def job_params
    params.require(:job).permit(:job_id)
  end

  def same_adjuster_params
    params.require(:same_adjuster).permit(:adjuster_id)
  end

  def phone_params
    params.require(:phones).permit(numbers:[], extensions:[], type_ids:[])
  end
end
