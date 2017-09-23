class JobPresenter < BasePresenter
  def job_manager_names_display
    job_manager_names.join('<br />').html_safe
  end
end
