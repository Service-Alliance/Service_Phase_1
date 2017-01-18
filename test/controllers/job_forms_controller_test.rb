require 'test_helper'

class JobFormsControllerTest < ActionController::TestCase
  setup do
    @job_form = job_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_form" do
    assert_difference('JobForm.count') do
      post :create, job_form: { document_id: @job_form.document_id, link: @job_form.link, name: @job_form.name, signed: @job_form.signed }
    end

    assert_redirected_to job_form_path(assigns(:job_form))
  end

  test "should show job_form" do
    get :show, id: @job_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_form
    assert_response :success
  end

  test "should update job_form" do
    patch :update, id: @job_form, job_form: { document_id: @job_form.document_id, link: @job_form.link, name: @job_form.name, signed: @job_form.signed }
    assert_redirected_to job_form_path(assigns(:job_form))
  end

  test "should destroy job_form" do
    assert_difference('JobForm.count', -1) do
      delete :destroy, id: @job_form
    end

    assert_redirected_to job_forms_path
  end
end
