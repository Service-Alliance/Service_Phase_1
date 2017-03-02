namespace :nightly do
    desc 'Will clearn unecessary records'
    task clean: :environment do
        Job.where(status_id: nil).destroy_all
        Call.where(inprogress: true).each do |call|
          call.inprogress = false
          call.save
        end
    end
end
