module TrackersHelper
  def tracker_link_to(tracker_task_id, trackable_id)
    if tracker_task_id == 1
      job_path(trackable_id)
    elsif tracker_task_id == 2
      job_job_managers_path(trackable_id)
    elsif tracker_task_id == 3
      job_path(trackable_id)
    elsif tracker_task_id == 4
      job_path(trackable_id)
      end
    end

  def next_step_link(tracker_task_id, trackable_id)
    if tracker_task_id == 1
      job_job_managers_path(trackable_id)
    elsif tracker_task_id == 2
      create_estimate_path(trackable_id)
    elsif tracker_task_id == 3
      create_estimate_sent_path(trackable_id)
    elsif tracker_task_id == 4
      create_contract_path(trackable_id)
    elsif tracker_task_id == 5
      create_contract_sent_path(trackable_id)
    elsif tracker_task_id == 6
      job_path(trackable_id)
    end
end
end
