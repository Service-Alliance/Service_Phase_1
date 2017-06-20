namespace :morning do
    desc 'Will send pending emails'
    task email: :environment do
      DailyUpdates.all_pending.deliver
      DailyUpdates.assignment_managers_pending.deliver
      DailyUpdates.new_york_pending.deliver
      DailyUpdates.new_jersey_pending.deliver
    end
end
