require 'test_helper'

class ContactAssignmentsControllerTest < ActionController::TestCase
  setup do
    @contact_assignment = contact_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_assignment" do
    assert_difference('ContactAssignment.count') do
      post :create, contact_assignment: { contact_id: @contact_assignment.contact_id, job_id: @contact_assignment.job_id, note: @contact_assignment.note }
    end

    assert_redirected_to contact_assignment_path(assigns(:contact_assignment))
  end

  test "should show contact_assignment" do
    get :show, id: @contact_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_assignment
    assert_response :success
  end

  test "should update contact_assignment" do
    patch :update, id: @contact_assignment, contact_assignment: { contact_id: @contact_assignment.contact_id, job_id: @contact_assignment.job_id, note: @contact_assignment.note }
    assert_redirected_to contact_assignment_path(assigns(:contact_assignment))
  end

  test "should destroy contact_assignment" do
    assert_difference('ContactAssignment.count', -1) do
      delete :destroy, id: @contact_assignment
    end

    assert_redirected_to contact_assignments_path
  end
end
