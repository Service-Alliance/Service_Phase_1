module AgentsHelper
  def new_or_view_agent_path(job, agent)
    agent ? agent_path(agent, job_id: job.id) : new_agent_path(job_id: job.id)
  end
end
