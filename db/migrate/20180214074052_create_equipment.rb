class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
    	t.string :name, required: true
    	t.string :rfid, required: true
    	t.string :equipment_type, required: true
    	t.decimal :asset_cost, required: true
    	t.decimal :rental_cost, required: true
        t.string :location, required: true
    	t.date :purchased
    	t.text :notes
    end
  end
end
