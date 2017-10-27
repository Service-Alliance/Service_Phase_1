require 'test_helper'
require_relative '../../app/controllers/tsheets/users_controller'

class Tsheets::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test "#update" do
    patch :update, format: :json, id: @user
    assert_response :success
  end
end
