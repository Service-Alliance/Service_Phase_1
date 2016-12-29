require 'test_helper'

class JobDetailsControllerTest < ActionController::TestCase
  setup do
    @job_detail = job_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_detail" do
    assert_difference('JobDetail.count') do
      post :create, job_detail: { claim_number: @job_detail.claim_number, coverage_type_id: @job_detail.coverage_type_id, deductible_amount: @job_detail.deductible_amount, deductible_id: @job_detail.deductible_id, emergency_service_amount: @job_detail.emergency_service_amount, esl_nst_amount_id: @job_detail.esl_nst_amount_id, insurance_company_id: @job_detail.insurance_company_id, job_id: @job_detail.job_id, policy_number: @job_detail.policy_number, self_pay_id: @job_detail.self_pay_id }
    end

    assert_redirected_to job_detail_path(assigns(:job_detail))
  end

  test "should show job_detail" do
    get :show, id: @job_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_detail
    assert_response :success
  end

  test "should update job_detail" do
    patch :update, id: @job_detail, job_detail: { claim_number: @job_detail.claim_number, coverage_type_id: @job_detail.coverage_type_id, deductible_amount: @job_detail.deductible_amount, deductible_id: @job_detail.deductible_id, emergency_service_amount: @job_detail.emergency_service_amount, esl_nst_amount_id: @job_detail.esl_nst_amount_id, insurance_company_id: @job_detail.insurance_company_id, job_id: @job_detail.job_id, policy_number: @job_detail.policy_number, self_pay_id: @job_detail.self_pay_id }
    assert_redirected_to job_detail_path(assigns(:job_detail))
  end

  test "should destroy job_detail" do
    assert_difference('JobDetail.count', -1) do
      delete :destroy, id: @job_detail
    end

    assert_redirected_to job_details_path
  end
end
