class AddAdwordsClientIdToFranchises < ActiveRecord::Migration
  def change
    add_column :franchises, :adwords_client_id, :string
  end
end
