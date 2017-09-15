class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :job_assignments_list]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def list
    @users = User.includes(:department)
    render :json => @users.to_json(include: [:department])
  end


  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @phones = @user.phones
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        @user.phones.destroy_all
        phone_count = phone_params["type_ids"].try(:count) || 0

        phone_count.times do |index|
          unless phone_params["numbers"][index] == ""
            @user.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
          end
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.phones.destroy_all
        phone_count = phone_params["type_ids"].try(:count) || 0

        phone_count.times do |index|
          unless phone_params["numbers"][index] == ""
            @user.phones.create(type_id: phone_params["type_ids"][index], number: phone_params["numbers"][index], extension: phone_params["extensions"][index])
          end
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def job_assignments
    @search = Job.joins(:job_managers).merge(JobManager.where(:job_manager_id => params[:id])).order('created_at DESC').search(params[:q])
    # @jobs = @search.result
    @jobs = @search.result.includes(:customer_address).page(params[:page]).order('created_at DESC')
    @all_results = @search.result

    respond_to do |format|
      format.html
      format.csv { render text: @all_results.to_csv }
    end

  end

  def job_assignments_list
    @search = Job.joins(:job_managers).merge(JobManager.where(:job_manager_id => current_user.id)).order('created_at DESC').search(params[:q])
    # @jobs = @search.result
    @jobs = @search.result.includes(:customer_address).page(params[:page]).order('created_at DESC')
    @all_results = @search.result

    respond_to do |format|
      format.html
      format.csv { render text: @all_results.to_csv }
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      user = User.find(params[:id])
      @user = UserPresenter.new(user, view_context)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :access_level , :username, :email, :password, :salt, :encrypted_password, :first_name, :role_id, :notes, :department_id, :title, :additional_title, :location_id, :background_check, :online_physical, :fitness_test, :hep_b, :lead, :lead_expiration, :nys_mold, :nys_mold_expiration, :nys_mold_license, :bio_rec_bbp, :hartford, :pet_water, :pet_fire, :osha, :iicrc_reg, :iicrc_expiration, :cec_due, :number_cec_due, :iicrc_wrt, :iicrc_amrt, :iicrc_asd, :iicrc_srt, :iicrc_hst, :iicrc_uft, :iicrc_odor, :iicrc_cds, :sub_1, :sub_2, :dry_book, :login_count)
    end

    def phone_params
      params.fetch(:phones, {}).permit(numbers:[], extensions:[], type_ids:[])
    end
end
