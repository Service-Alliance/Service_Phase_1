require 'test_helper'

class Api::V1::Datatables::JobsControllerTest < ActionController::TestCase
  def setup
    sign_in(users(:one))
  end

  test '#index' do
    get :index, format: :json
    assert_response :success
  end

  test '#index search' do
    get :index, format: :json, search: 'one'
    assert_response :success
    assert_match /One/, response.body
  end
end
