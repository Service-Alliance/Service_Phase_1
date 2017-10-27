require 'test_helper'
require_relative '../../app/controllers/tsheets/users_controller'

class Tsheets::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test "#update" do
    get :update, format: :json, id: @user.id
    assert_response :success
  end
end
