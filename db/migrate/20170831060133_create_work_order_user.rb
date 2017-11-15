class CreateWorkOrderUser < ActiveRecord::Migration
  def change
    create_table :work_order_user do |t|
      t.references :work_order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
