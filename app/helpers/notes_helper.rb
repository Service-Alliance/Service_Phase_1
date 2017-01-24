module NotesHelper
  def new_or_view_job_notes_path(job, note)
    note != [] ? job_notes_path(job.id) : new_note_path(job_id: job.id)
  end
end
