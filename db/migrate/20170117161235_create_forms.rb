class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.string :package_id
      t.string :transaction_id
      t.string :signer_id

      t.timestamps null: false
    end
  end
end
