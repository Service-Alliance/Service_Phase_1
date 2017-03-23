class AddEstimateToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :estimate_created, :boolean, default: false
    add_column :jobs, :estimate_created_date, :date
    add_column :jobs, :estimate_sent, :boolean, default: false
    add_column :jobs, :estimate_sent_date, :date

  end
end
