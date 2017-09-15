require 'test_helper'

class CorporateReferralTypesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    @corporate_referral_type = corporate_referral_types(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:corporate_referral_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create corporate_referral_type" do
    assert_difference('CorporateReferralType.count') do
      post :create, corporate_referral_type: { name: @corporate_referral_type.name }
    end

    assert_redirected_to corporate_referral_type_path(assigns(:corporate_referral_type))
  end

  test "should show corporate_referral_type" do
    get :show, id: @corporate_referral_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @corporate_referral_type
    assert_response :success
  end

  test "should update corporate_referral_type" do
    patch :update, id: @corporate_referral_type, corporate_referral_type: { name: @corporate_referral_type.name }
    assert_redirected_to corporate_referral_type_path(assigns(:corporate_referral_type))
  end

  test "should destroy corporate_referral_type" do
    assert_difference('CorporateReferralType.count', -1) do
      delete :destroy, id: @corporate_referral_type
    end

    assert_redirected_to corporate_referral_types_path
  end
end
