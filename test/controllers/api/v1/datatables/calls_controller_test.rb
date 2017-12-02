require 'test_helper'

class Api::V1::Datatables::CallsControllerTest < ActionController::TestCase
  def setup
    sign_in(users(:one))
  end

  test '#index' do
    get :index, format: :json
    assert_response :success
  end
end
