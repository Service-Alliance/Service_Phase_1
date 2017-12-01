class TsheetsService
  class MissingTsheetsId < StandardError; end

  def initialize(adapter = TsheetsAdapter.new)
    @adapter = adapter
  end

  def update_timesheets(for_user)
    raise MissingTsheetsId.new if for_user.tsheets_id.nil?

    response = @adapter.timesheets(for_user.tsheets_id)

    if response['results']
      for_user.timesheets = response['results']['timesheets']
      for_user.save
    end

    response
  end

  def find_by_names(term)
    match_first_name = @adapter.find_users(first_name: "#{term}*")
    match_last_name = @adapter.find_users(last_name: "#{term}*")
    (match_first_name + match_last_name).uniq
  end
end
