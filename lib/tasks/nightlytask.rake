namespace :nightly do
    desc 'Will clearn unecessary records'
    task clean: :environment do
        Job.where(keep_record: false).destroy_all
        Call.where(inprogress: true).each do |call|
          call.inprogress = false
          call.save
        end
    end
end
