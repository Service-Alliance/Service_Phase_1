class AddFieldsToCustomer < ActiveRecord::Migration
  def change
      add_column :customers, :sharp_spring_id, :text
      add_column :customers, :company_name, :text
      add_column :customers, :title, :text
      add_column :customers, :website, :text
      add_column :customers, :category, :text
      add_column :customers, :sub_category, :text
  end
end
