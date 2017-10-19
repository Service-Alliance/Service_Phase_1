# frozen_string_literal: true
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:two)
  end

  test '#user_metrics' do
    EXPECTED = [
      {:name=>"Jobs", :data=>{}},
      {:name=>"Notes", :data=>{}},
      {:name=>"Pricings Created", :data=>{}},
      {:name=>"Work Orders", :data=>{}}
    ].freeze

    assert_equal EXPECTED, User.user_metrics(1)
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


  test "tsheet_info" do
    EXPECTED = {
      'tsheets_email' => 'toneboneus@gmail.com',
      'tsheets_email_verified' => true,
      'tsheets_username' => 'amartinez',
      'tsheets_active' => true,
      'tsheets_last_name' => 'MARTINEZ',
      'tsheets_first_name' => 'ANTHONY',
      'tsheets_company_name' => 'Servpromedfordny',
      'tsheets_id' => 459375
    }

    assert_equal ({}), users(:one).tsheet_info
    assert_equal EXPECTED, users(:with_tsheet).tsheet_info
  end
end
