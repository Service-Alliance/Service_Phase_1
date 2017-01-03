class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :callrail_id
      t.string :callsource
      t.date :datetime
      t.string :trackingnum
      t.string :customer_phone_number
      t.string :destinationnum
      t.string :customer_name
      t.string :customer_city
      t.string :customer_state
      t.string :customer_zip
      t.string :customer_county
      t.string :keywords
      t.string :referrer
      t.string :referrermedium
      t.string :landingpage
      t.string :last_requested_url
      t.string :gclid
      t.string :ip
      t.string :utm_source
      t.string :utm_medium
      t.string :utm_term
      t.string :utm_content
      t.string :utm_campaign
      t.string :utma
      t.string :utmb
      t.string :utmv
      t.string :utmz
      t.string :utmx
      t.string :ga
      t.string :first_call
      t.string :recording
      t.string :duration
      t.boolean :answered
      t.integer :user_id
      t.integer :job_id

      t.integer :duration

      t.timestamps null: false
    end
  end
end
