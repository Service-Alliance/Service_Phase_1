class CreateAssignmentTypes < ActiveRecord::Migration
  def change
    create_table :assignment_types do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
