namespace :import do
    desc 'Import Logbook'
    task logbook: :environment do
      csv_text = File.read("#{Rails.root}/lib/assets/logbook_seed.csv")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        hash = row.to_hash
        date = hash['date']

        last_name = hash["last_name"]
        first_name = hash["first_name"]
        note = hash["note"]
        scope = hash["Scope"]

        formatted_date = Date.strptime(date, '%m/%d/%Y')
        loss_cause = LossCause.find_by(name: scope)

        p customer = Customer.create(first_name: first_name, last_name: last_name)
        p job = Job.create(status_id: 3, job_note: note, recieved: formatted_date, customer_id: customer.id)
        p Loss.create(job_id: job.id, loss_cause_id: loss_cause.try(:id))

      end

    end
end
