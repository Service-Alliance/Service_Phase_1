class AddFieldsToContacts < ActiveRecord::Migration
  def change
  	  add_column :contacts, :sharp_spring_id, :text
      add_column :contacts, :company_name, :text
      add_column :contacts, :title, :text
      add_column :contacts, :website, :text
      add_column :contacts, :sub_category, :text
  end
end
