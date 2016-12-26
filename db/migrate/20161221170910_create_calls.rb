class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :callrail_id
      t.string :recording
      t.string :callrail_user
      t.integer :user_id
      t.integer :job_id
      t.datetime :start_time
      t.string :customer_phone_number
      t.integer :duration

      t.timestamps null: false
    end
  end
end
