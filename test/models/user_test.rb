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

  test "#with tsheets_id" do
    assert_equal @user,User.with_tsheets_id(@user.tsheets_id).first
    assert_nil User.with_tsheets_id('missing_id').first
  end

  test "tsheet_id" do
    assert_nil users(:one).tsheets_id
    assert_equal 459375, users(:with_tsheet).tsheets_id
  end

  test "tsheet_info" do
    EXPECTED = {
      'email' => 'toneboneus@gmail.com',
      'email_verified' => true,
      'username' => 'amartinez',
      'active' => true,
      'last_name' => 'MARTINEZ',
      'first_name' => 'ANTHONY',
      'company_name' => 'Servpromedfordny',
      'id' => 459375
    }

    assert_equal ({}), users(:one).tsheet_info
    assert_equal EXPECTED, users(:with_tsheet).tsheet_info
  end

  test '#text_search searches user name' do
    results = User.text_search('dave')
    assert_includes results, users(:one)
    refute_includes results, users(:two)
  end
end
