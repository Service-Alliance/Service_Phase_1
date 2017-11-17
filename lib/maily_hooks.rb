caller = ''
user = User.new(email: 'user@example.com', first_name: 'Dan', last_name: 'Kluger')
job_manager = ''
job = Job.new(id: '12345', name: 'ESL Loss', franchise_id: '1', customer_id: '12345')
work_order = WorkOrder.new(id: '12345', job_id: '12345', to: 'nil', name: 'nil',
  typed_by: 'nil', job_location: '160 Hickory Street Port Jefferson Station, NY, 11776 ',
 telephone: '123456789', scope_of_work: 'text', required: 'text',
  number_of_crew_chiefs: '1', number_of_technicians: '1',  estimated_hours: '4 hours')
customer = Customer.new(id:'12345', first_name: 'John', last_name: 'Smith')

Maily.hooks_for('ApplicationMailer') do |mailer|
end

Maily.hooks_for('CustomerMailer') do |mailer|
  mailer.register_hook(:welcome_email, caller)
end

Maily.hooks_for('DailyUpdate') do |mailer|
end

Maily.hooks_for('UserMailer') do |mailer|
  mailer.register_hook(:manager_assignment, user, job_manager)
  mailer.register_hook(:mention_notification, user, job)
  mailer.register_hook(:job_moved_to_invoiced, user, job)
  mailer.register_hook(:collections_user_added_to_job, user, job)
end

Maily.hooks_for('WorkOrderMailer') do |mailer|
  mailer.register_hook(:notification, user, job, work_order)
  mailer.register_hook(:vendor_notification, customer, job, work_order)
  mailer.register_hook(:draft, user, job, work_order)
end
