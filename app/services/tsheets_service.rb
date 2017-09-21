class TsheetsService
  def initialize(adapter = TsheetsAdapter.new)
    @adapter = adapter
  end

  #TODO: after seed migration will be done, this method could be safely dropped (it's a one off)
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

  def find_by_names(term)
    match_first_name = @adapter.find_users(first_name: "#{term}*")
    match_last_name = @adapter.find_users(last_name: "#{term}*")
    (match_first_name + match_last_name).uniq
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
