require 'test_helper'

class Tsheets::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test 'status should be okey' do
    get :index, term: 'test'
    assert_response :success
  end
end

