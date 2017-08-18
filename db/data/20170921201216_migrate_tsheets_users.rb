class MigrateTsheetsUsers < SeedMigration::Migration
  def up
    service = TsheetsService.new
    result = service.sync_users
    result[:synced].each do |user|
      puts "#{user.first_name} #{user.last_name} Synced"
    end
    puts ""
    result[:unable_to_sync].each do |user|
      puts "#{user.first_name} #{user.last_name} Unable to find local user with same name"
    end

    result[:matched].each do |user|
      puts "#{user.first_name} #{user.last_name} was synced before"
    end
  end
end
