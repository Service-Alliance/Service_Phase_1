require 'test_helper'

class UploadCategoriesControllerTest < ActionController::TestCase
  setup do
    @upload_category = upload_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upload_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload_category" do
    assert_difference('UploadCategory.count') do
      post :create, upload_category: { name: @upload_category.name }
    end

    assert_redirected_to upload_category_path(assigns(:upload_category))
  end

  test "should show upload_category" do
    get :show, id: @upload_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upload_category
    assert_response :success
  end

  test "should update upload_category" do
    patch :update, id: @upload_category, upload_category: { name: @upload_category.name }
    assert_redirected_to upload_category_path(assigns(:upload_category))
  end

  test "should destroy upload_category" do
    assert_difference('UploadCategory.count', -1) do
      delete :destroy, id: @upload_category
    end

    assert_redirected_to upload_categories_path
  end
end
