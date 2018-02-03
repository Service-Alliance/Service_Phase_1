class AddPriorities < SeedMigration::Migration
  def up
    high = Priority.find_or_create_by name: 'High'
    high.update_attributes(priority: 1, context: 'danger')
    med = Priority.find_or_create_by name: 'Med'
    med.update_attributes(priority: 2, context: 'warning')
    low = Priority.find_or_create_by name: 'Low'
    low.update_attributes(priority: 3, context: 'default')
  end

  def down

  end
end
