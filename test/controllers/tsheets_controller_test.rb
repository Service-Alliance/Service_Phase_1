require 'test_helper'

class Tsheets::UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test 'should raise error for html format' do
    VCR.use_cassette('tsheets_term_lookup') do
      get :index, term: 'test', format: :html
      assert_response :not_acceptable
    end
  end

  test 'should responde with success' do
    VCR.use_cassette('tsheets_term_lookup') do
      get :index, term: 'test', format: :json
      assert_response :success
    end
  end
end

