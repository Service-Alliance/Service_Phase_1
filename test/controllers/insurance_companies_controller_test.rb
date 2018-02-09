require 'test_helper'

class InsuranceCompaniesControllerTest < ActionController::TestCase
  setup do
    @insurance_company = insurance_companies(:one)
    sign_in(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insurance_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insurance_company" do
    assert_difference('InsuranceCompany.count') do
      post :create, insurance_company: @insurance_company.attributes
    end

    assert_redirected_to insurance_company_path(assigns(:insurance_company))
  end

  test "should show insurance_company" do
    get :show, id: @insurance_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insurance_company
    assert_response :success
  end

  test "should update insurance_company" do
    patch :update, id: @insurance_company, insurance_company: @insurance_company.attributes
    assert_redirected_to insurance_company_path(assigns(:insurance_company))
  end

  test "should save a tracker when updating insurance_company with note" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @insurance_company, insurance_company: insurance_company_params_with_note(@insurance_company.attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'Note Created'
      assert_equal t.trackable, @insurance_company
    end
  end

  test "should save a tracker when updating insurance_company with attachment" do
    assert_difference 'Tracker.count', 1 do
      patch :update, id: @insurance_company, insurance_company: insurance_company_params_with_attachment(@insurance_company.attributes)
    end
    Tracker.last.tap do |t|
      assert_equal t.tracker_task.name, 'File Uploaded'
      assert_equal t.trackable, @insurance_company
    end
  end

  test "should destroy insurance_company" do
    assert_difference('InsuranceCompany.count', -1) do
      delete :destroy, id: @insurance_company
    end

    assert_redirected_to insurance_companies_path
  end

  def insurance_company_params_with_note(attribs)
    attribs.merge(notes_attributes: [{content: 'note'}])
  end

  def insurance_company_params_with_attachment(attribs)
    attribs.merge(uploads_attributes: [{description: 'desc', upload_category_id: upload_categories(:one).id}])
  end
end
