class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  def index
    @notes = Note.all
  end

  def show

  end

  def job_notes
    @job = Job.find_by(id: params[:job_id])
    @notes = @job.notes
  end

  def new
    @note = Note.new
    @job = Job.find_by(id: params[:job_id])
  end

  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    unless job_params.empty?
      @job = Job.find_by(id: job_params['job_id'])
      @note = @job.notes.new(note_params)
      @note.user_id = current_user.id
# FIXME This does not work for User Id 43 { First Name: 'Juan Carlos Gutierrez'}
      if @note.content.include?("@")
        arr = @note.content.split(' ')
        mentions = arr.select { |str| str.include?('@') }
        notify_type = NotifyType.find_by(name: "Mentioned in Note")
        mentions.each do |mention|
          mention[0] = ''
          name = mention.split("_")
          user = User.find_by(first_name: name[0], last_name: name[1])
          if user
            Notification.create(notify_type: notify_type.id,actor_id: current_user.id, target_id: user.id, job_id: @job.id, notify_text: "#{current_user.full_name} mentioned you in a job note.")
            UserMailer.mention_notification(user, @job).deliver_later
          end
        end

      end
    end
    unless call_params.empty?
      @job = Job.find_by(id: call_params['job_id'])
      @call = Call.find_by(id: call_params['call_id'])
      @note = @call.notes.new(note_params)
      @note.user_id = current_user.id
    end

    respond_to do |format|
      if @note.save
        @job.track('Note Created', current_user, @note) unless job_params.empty?
        format.html { redirect_to job_path(@job), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end
    def job_params
      params.fetch(:job, {}).permit(:job_id)
    end
    def call_params
      params.fetch(:call, {}).permit(:call_id, :job_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content, :job_id)
    end
end
