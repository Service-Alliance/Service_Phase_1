class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.references :noteable, index: true, polymorphic: true
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
