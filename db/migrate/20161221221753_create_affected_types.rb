class CreateAffectedTypes < ActiveRecord::Migration
  def change
    create_table :affected_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
