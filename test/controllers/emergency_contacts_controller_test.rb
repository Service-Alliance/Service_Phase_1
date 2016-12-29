require 'test_helper'

class EmergencyContactsControllerTest < ActionController::TestCase
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emergency_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emergency_contact" do
    assert_difference('EmergencyContact.count') do
      post :create, emergency_contact: { address_id: @emergency_contact.address_id, email: @emergency_contact.email, first_name: @emergency_contact.first_name, job_id: @emergency_contact.job_id, last_name: @emergency_contact.last_name }
    end

    assert_redirected_to emergency_contact_path(assigns(:emergency_contact))
  end

  test "should show emergency_contact" do
    get :show, id: @emergency_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emergency_contact
    assert_response :success
  end

  test "should update emergency_contact" do
    patch :update, id: @emergency_contact, emergency_contact: { address_id: @emergency_contact.address_id, email: @emergency_contact.email, first_name: @emergency_contact.first_name, job_id: @emergency_contact.job_id, last_name: @emergency_contact.last_name }
    assert_redirected_to emergency_contact_path(assigns(:emergency_contact))
  end

  test "should destroy emergency_contact" do
    assert_difference('EmergencyContact.count', -1) do
      delete :destroy, id: @emergency_contact
    end

    assert_redirected_to emergency_contacts_path
  end
end
