class MigrateTsheetsService
  def initialize(adapter = TsheetsAdapter.new)
    @adapter = adapter
  end

  def sync_users
    unable_to_sync, synced, matched = [], [], []

    @adapter.find_users.each do |user|
      result = sync_user(user)
      unable_to_sync << user if result == :unable_to_sync
      synced << user if result == :synced
      matched << user if result == :nothing_to_do
    end

    {
      synced: synced, #user found and saved
      unable_to_sync: unable_to_sync, #corresponding user not found in our database
      matched: matched #user was synced before
    }
  end

  private

  def sync_user(tsheets_user)
    return :nothing_to_do if User.with_tsheets_id(tsheets_user.id).present?

    local_user = User.with_first_and_last_names(tsheets_user.first_name, tsheets_user.last_name).first!
    local_user.update_attributes!(
      tsheets:  tsheets_user.all_attributes.map{|k, v| ["tsheets_#{k}", v]}.to_h
    )
    return :synced
  rescue ActiveRecord::RecordNotFound
    return :unable_to_sync
  rescue => e
    Honeybadger.notify(e)
    return :unable_to_sync
  end
end


class MigrateTsheetsUsers < SeedMigration::Migration
  def up
    service = MigrateTsheetsService.new
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
