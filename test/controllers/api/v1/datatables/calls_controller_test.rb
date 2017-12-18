require 'test_helper'

class Api::V1::Datatables::CallsControllerTest < ActionController::TestCase
  def setup
    sign_in(users(:one))
  end

  test '#index' do
    get :index, format: :json
    assert_response :success
  end

  test '#index search' do
    get :index, format: :json, search: '+01234'
    assert_response :success
    assert_match /callrailcalltwo/, response.body
    refute_match /callrailcallone/, response.body
  end

  test '#index search ignores preceeding +' do
    get :index, format: :json, search: '01234'
    assert_response :success
    assert_match /callrailcalltwo/, response.body
    refute_match /callrailcallone/, response.body
  end
end
