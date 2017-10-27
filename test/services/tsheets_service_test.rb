require 'test_helper'

class TsheetsAdapterFake
  USERS = {
    valid: TSheets::Models::User.new(id: 1234, first_name: 'Dave', last_name: 'Jones'),
    missing: TSheets::Models::User.new(id: 5678, first_name: 'Darren', last_name: 'Smith')
  }
  def find_users
    [USERS[:valid], USERS[:missing]]
  end
end

class TsheetsServiceTest < ActiveSupport::TestCase
  def setup
    @service = TsheetsService.new(TsheetsAdapterFake.new)
    @valid_user = TsheetsAdapterFake::USERS[:valid]
    @missing_user = TsheetsAdapterFake::USERS[:missing]
  end
end
