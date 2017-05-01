class CreateNotifyTypes < ActiveRecord::Migration
  def change
    create_table :notify_types do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
