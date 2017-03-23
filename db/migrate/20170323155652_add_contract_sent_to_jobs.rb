class AddContractSentToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contract_created, :boolean, default: false
    add_column :jobs, :contract_created_date, :date
    add_column :jobs, :contract_sent, :boolean, default: false
    add_column :jobs, :contract_sent_date, :date
  end
end
