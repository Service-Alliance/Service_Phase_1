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

  test "doesn't work with users that have tsheet_id already" do
    user = User.create(
      tsheets: {tsheets_id: @valid_user.id},
      email: 'test25@test.com',
      password: 'test123',
      password_confirmation: 'test123'
    )

    result = @service.sync_users
    assert_equal [@missing_user], result[:unable_to_sync]
    assert_equal [], result[:synced]
    assert_equal [@valid_user], result[:matched]

    user.destroy
  end

  test "sync_users sets the tsheets_user_id for users it's able to match up by name" do
    @service.sync_users

    users(:one).tsheets.tap do |tsheet|
      assert_equal @valid_user.id, tsheet['tsheets_id']
      assert_equal @valid_user.first_name, tsheet['tsheets_first_name']
      assert_equal @valid_user.last_name, tsheet['tsheets_last_name']
    end
  end

  test "sync_users doesn't touch users it can't match" do
    count = User.where(tsheets:{}).count
    @service.sync_users

    assert_equal count, User.where(tsheets:{}).count
  end

  test "doesn't add new users" do
    result = @service.sync_users

    assert_equal 1, result[:unable_to_sync].count
    assert_equal @missing_user, result[:unable_to_sync].first
    assert_equal 0, User.with_tsheets_id(@missing_user.id).count
  end
end
