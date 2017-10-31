require 'test_helper'

class TimesheetsControllerTest < ActionController::TestCase
  setup do
    @user = users(:with_tsheet)
    sign_in(@user)
  end

  test '#index' do
    get :index, user_id: @user.id, format: :json
    assert_response :success
  end
end
