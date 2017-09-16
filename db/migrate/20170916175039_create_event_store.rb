class CreateEventStore < ActiveRecord::Migration
  def change
    create_table :event_stores do |t|
      t.string :event_type, :null => false
      t.json :data, :null => false
      t.timestamps
    end
  end
end
