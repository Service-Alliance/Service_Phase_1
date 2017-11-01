require 'test_helper'

class TsheetsAdapterFake
  USERS = {
    valid: TSheets::Models::User.new(id: 1234, first_name: 'Dave', last_name: 'Jones'),
    missing: TSheets::Models::User.new(id: 5678, first_name: 'Darren', last_name: 'Zack')
  }
  def find_users(*args)
    [USERS[:valid]]
  end
end

class TsheetsServiceTest < ActiveSupport::TestCase
  def setup
    @service = TsheetsService.new(TsheetsAdapterFake.new)
    @valid_user = TsheetsAdapterFake::USERS[:valid]
  end

  test "#find_by_names" do
    assert_equal [@valid_user], @service.find_by_names('Dave')
  end

  test "update_timesheets errors" do
    assert_raises(TsheetsService::MissingTsheetsId) { @service.update_timesheets(users(:one)) }
  end

  test "#update_timesheets" do
    user = users(:with_tsheet)
    VCR.use_cassette('timesheet request, with service') do
      assert user.timesheets.blank?

      TsheetsService.new.update_timesheets(user).tap do |result|
        assert_kind_of Hash, result
        refute_nil result['results']
        assert result['more']
        refute_nil result['supplemental_data']
      end

      assert_equal 50, user.reload.timesheets.count
    end
  end
end
