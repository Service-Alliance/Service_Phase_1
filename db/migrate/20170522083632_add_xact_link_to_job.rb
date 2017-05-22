class AddXactLinkToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :xact_link, :text
  end
end
