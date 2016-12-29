class CreateAdjusters < ActiveRecord::Migration
  def change
    create_table :adjusters do |t|
      t.integer :job_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :address_id

      t.timestamps null: false
    end
  end
end
