class AddCategoryToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :category, :integer
  end
end
