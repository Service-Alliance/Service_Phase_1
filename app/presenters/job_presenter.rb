class JobPresenter < BasePresenter
  def job_manager_names_display
    job_manager_names.join('<br />')
  end

  def to_display
    to.join('<br />')
  end
end
