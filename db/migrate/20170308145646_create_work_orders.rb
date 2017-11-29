class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :job_id
      t.text :to
      t.text :name
      t.date :date
      t.text :typed_by
      t.datetime :job_start
      t.text :job_name
      t.text :job_location
      t.text :telephone
      t.text :contact
      t.text :insurance
      t.text :claim_number
      t.text :crew
      t.time :approx_time_on_loss
      t.text :required
      t.text :referral
      t.text :franchise_location
      t.text :scope_of_work
      t.text :job_manager_contact_info
      t.integer :state

      t.timestamps null: false
    end
  end
end
