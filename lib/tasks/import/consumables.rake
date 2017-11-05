namespace :import do
  desc 'Import initial consumables data'

  task consumables: :environment do
    csv = Rails.root.join('lib', 'assets', 'Consumables.csv')
    CSV.foreach(csv, headers: true) do |row|
      rowh = row.to_hash
      consumable = Consumable.find_by(name: rowh['name'])
      Consumable.create!(rowh) if consumable.nil?
    end
  end
end
