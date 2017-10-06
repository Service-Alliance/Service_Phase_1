module EmailDeliveryHelper
  def mail_enqueued_for_user(user)
    user_id = user.to_global_id.to_s
    jobs = enqueued_jobs.select{ |j| j[:args][3]["_aj_globalid"] == user_id }
    jobs.size > 0
  end

  def no_mail_enqueued_for_user(user)
    !mail_enqueued_for_user(user)
  end
end
