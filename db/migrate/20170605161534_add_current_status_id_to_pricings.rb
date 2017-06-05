class AddCurrentStatusIdToPricings < ActiveRecord::Migration
  def change
    add_column :pricings, :current_status_id, :integer
    add_column :pricings, :job_id, :integer
  end
end
