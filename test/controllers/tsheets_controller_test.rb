require 'test_helper'

class Tsheets::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test 'should raise error for html format' do
    assert_raises(ActionView::MissingTemplate) { get :index, term: 'test', format: :html }
  end

  test 'should responde with success' do
    get :index, term: 'test', format: :json
    assert_response :success
  end
end

