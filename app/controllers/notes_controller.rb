class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show

  end

  def job_notes
    @job = Job.find_by(id: params[:job_id])
    @notes = @job.notes
  end

  # GET /notes/new
  def new
    @note = Note.new
    @job = Job.find_by(id: params[:job_id])
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @job = Job.find_by(id: job_params['job_id'])
    @note = @job.notes.new(note_params)
    @note.user_id = current_user.id

    respond_to do |format|
      if @note.save
        format.html { redirect_to job_notes_path(@job), notice: 'Note was successfully created.' }
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
      params.require(:job).permit(:job_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:note, :job_id)
    end
end
