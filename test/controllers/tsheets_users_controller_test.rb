require 'test_helper'
require_relative '../../app/controllers/tsheets/users_controller'

class Tsheets::UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:with_tsheet)
    sign_in(@user)
  end

  test "#update" do
    patch :update, format: :json, id: @user.id
    assert_response :success
  end
end
