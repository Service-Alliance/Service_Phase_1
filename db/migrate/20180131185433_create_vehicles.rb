class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
    	t.integer :year, required: true
    	t.string :name, required: true
    	t.string :state, required: true
    	t.string :brand, required: true
    	t.string :license_plate, required: true
    	t.integer :mileage, required: true
    	t.date :registration_date, required: true
    	t.date :insurance_date, required: true
    	t.date :inspection_date, required: true
    	t.integer :oil_change
    	t.integer :brakes
        t.integer :battery
    	t.integer :filters
    	t.integer :tires
        t.integer :transmission
    	t.integer :fluids
    	t.string :miscellaneous

    	t.timestamps null: false
    end
  end
end