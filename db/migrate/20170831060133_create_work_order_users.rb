class CreateWorkOrderUsers < ActiveRecord::Migration
  def change
    create_table :work_order_users do |t|
      t.references :work_order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
