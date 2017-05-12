require 'test_helper'

class InspectionChecklistsControllerTest < ActionController::TestCase
  setup do
    @inspection_checklist = inspection_checklists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inspection_checklists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inspection_checklist" do
    assert_difference('InspectionChecklist.count') do
      post :create, inspection_checklist: { additional_vendor: @inspection_checklist.additional_vendor, estimate_given_verbally: @inspection_checklist.estimate_given_verbally, estimate_range: @inspection_checklist.estimate_range, estimate_will_be_sent: @inspection_checklist.estimate_will_be_sent, next_steps: @inspection_checklist.next_steps, notes: @inspection_checklist.notes, potential_construction: @inspection_checklist.potential_construction, send_within_one_day: @inspection_checklist.send_within_one_day, verify_information: @inspection_checklist.verify_information }
    end

    assert_redirected_to inspection_checklist_path(assigns(:inspection_checklist))
  end

  test "should show inspection_checklist" do
    get :show, id: @inspection_checklist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inspection_checklist
    assert_response :success
  end

  test "should update inspection_checklist" do
    patch :update, id: @inspection_checklist, inspection_checklist: { additional_vendor: @inspection_checklist.additional_vendor, estimate_given_verbally: @inspection_checklist.estimate_given_verbally, estimate_range: @inspection_checklist.estimate_range, estimate_will_be_sent: @inspection_checklist.estimate_will_be_sent, next_steps: @inspection_checklist.next_steps, notes: @inspection_checklist.notes, potential_construction: @inspection_checklist.potential_construction, send_within_one_day: @inspection_checklist.send_within_one_day, verify_information: @inspection_checklist.verify_information }
    assert_redirected_to inspection_checklist_path(assigns(:inspection_checklist))
  end

  test "should destroy inspection_checklist" do
    assert_difference('InspectionChecklist.count', -1) do
      delete :destroy, id: @inspection_checklist
    end

    assert_redirected_to inspection_checklists_path
  end
end
