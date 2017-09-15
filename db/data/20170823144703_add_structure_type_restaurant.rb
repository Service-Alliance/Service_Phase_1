class AddStructureTypeRestaurant < SeedMigration::Migration
  def up
    StructureType.create!(name: 'Restaurant')
  end

  def down
    StructureType.find_by(name: 'Restaurant').destroy
  end
end
