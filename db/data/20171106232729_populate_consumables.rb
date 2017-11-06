class PopulateConsumables < SeedMigration::Migration
  def up
    csv = Rails.root.join('db', 'files', 'Consumables.csv')
    CSV.foreach(csv, headers: true) do |row|
      rowh = row.to_hash
      consumable = Consumable.find_by(name: rowh['name'])
      Consumable.create!(rowh) if consumable.nil?
    end
  end
end
