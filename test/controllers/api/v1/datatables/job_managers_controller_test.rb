require 'test_helper'

class Api::V1::Datatables::JobManagersControllerTest < ActionController::TestCase
  def setup
    sign_in(users(:one))
  end

  test '#index' do
    get :index, format: :json
    assert_response :success
  end

  test '#index search' do
    get :index, format: :json, search: 'dave'
    assert_response :success
    assert_match /Dave/, response.body
    refute_match /Barry/, response.body
  end
end
