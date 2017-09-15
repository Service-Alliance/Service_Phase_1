require 'test_helper'

class EmergencyContactsControllerTest < ActionController::TestCase
  setup do
    @emergency_contact = emergency_contacts(:one)
    sign_in(users(:one))
  end

  test "should get new" do
    get :new, job_id: @emergency_contact.job_id
    assert_response :success
  end

  test "should create emergency_contact" do
    assert_difference('EmergencyContact.count') do
      post :create, job_id: @emergency_contact.job_id,
           address: addresses(:california).attributes,
           phones: phones(:thai).attributes,
           emergency_contact: { email: @emergency_contact.email, first_name: @emergency_contact.first_name, job_id: @emergency_contact.job_id, last_name: @emergency_contact.last_name }
    end

    assert_redirected_to job_emergency_contact_path(@emergency_contact.job_id, assigns(:emergency_contact))
  end

  test "should show emergency_contact" do
    get :show, job_id: @emergency_contact.job_id, id: @emergency_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, job_id: @emergency_contact.job_id, id: @emergency_contact
    assert_response :success
  end

  test "should update emergency_contact" do
    patch :update, job_id: @emergency_contact.job_id, id: @emergency_contact,
          address: addresses(:california).attributes,
          phones: phones(:thai).attributes,
          emergency_contact: { email: @emergency_contact.email, first_name: @emergency_contact.first_name, job_id: @emergency_contact.job_id, last_name: @emergency_contact.last_name }
    assert_redirected_to job_emergency_contact_path(@emergency_contact.job_id, assigns(:emergency_contact))
  end

  test "should destroy emergency_contact" do
    assert_difference('EmergencyContact.count', -1) do
      delete :destroy, job_id: @emergency_contact.job_id, id: @emergency_contact
    end

    assert_redirected_to job_emergency_contacts_path
  end
end
