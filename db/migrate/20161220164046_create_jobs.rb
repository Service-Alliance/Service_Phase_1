class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :type_id
      t.integer :status_id
      t.integer :entered_by_id
      t.integer :franchise_id
      t.text :details
      t.text :notes
      t.integer :customer_id
      t.integer :referral_type_id

      t.timestamps null: false
    end
  end
end
