require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:two)
  end

  test '#with_first_and_last_names' do
    assert_equal 1, User.with_first_and_last_names(@user.first_name, @user.last_name).count
    assert_equal 0, User.with_first_and_last_names('random', 'random').count
    assert_equal 0, User.with_first_and_last_names(nil, nil).count
  end

  test "#tsheets_user_full_name" do
    assert_equal '', users(:one).tsheets_full_name

    user = User.new(tsheets_first_name:'first', tsheets_last_name:'last')
    assert_equal "first last", user.tsheets_full_name
  end


  test "#with tsheets_id" do
    assert_equal @user,User.with_tsheets_id(@user.tsheets_id).first
    assert_nil User.with_tsheets_id('missing_id').first
  end
end
