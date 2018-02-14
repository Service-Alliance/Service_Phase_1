class PopulateEquipment < SeedMigration::Migration
  def up
    csv = Rails.root.join('db', 'files', 'Equipment.csv')
    CSV.foreach(csv, headers: true) do |row|
      rowh = row.to_hash
      equipment = Equipment.find_by(name: rowh['name'])
      Equipment.create!(rowh) if equipment.nil?
    end
  end

  def down
  end
end
