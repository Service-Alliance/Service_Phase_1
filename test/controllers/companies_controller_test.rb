require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: @company.attributes
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: @company.attributes
    assert_redirected_to company_path(assigns(:company))
  end

  test "should save a tracker when updating company with note" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @company, company: company_params_with_note(@company.attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'Note Created'
      assert_equal t.trackable, @company
    end
  end

  test "should save a tracker when updating company with attachment" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @company, company: company_params_with_attachment(@company.attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'File Uploaded'
      assert_equal t.trackable, @company
    end
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end

  def company_params_with_note(attribs)
    attribs.merge(notes_attributes: [{content: 'note'}])
  end

  def company_params_with_attachment(attribs)
    attribs.merge(uploads_attributes: [{description: 'desc', upload_category_id: upload_categories(:one).id}])
  end
end
