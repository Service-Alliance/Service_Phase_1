require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @job = jobs(:one)
    @company = companies(:one)

    sign_in(@user)
  end

  test '#index' do
    get :index
    assert_response :success
  end

  test '#new' do
    get :new
    assert_response :success
  end

  test '#create - successfully created' do
    post :create, job: {type_id: @job.type_id, id: @job.id}, company: {name: @company.name}, phones: { type_ids: []}

    assert_equal 'Job was successfully created.', flash[:notice]
    assert_response :redirect
  end

  test '#create - successfully saved and move to job loss' do
    post :create, commit: 'Save and Move to Job Loss', job: {type_id: @job.type_id, id: @job.id}, company: {name: @company.name}, phones: { type_ids: []}

    assert_equal 'Job was successfully created.', flash[:notice]
    assert_response :redirect
  end

  test '#create - successfully saved' do
    post :create, commit: 'Save', job: {type_id: @job.type_id, id: @job.id}, company: {name: @company.name}, phones: { type_ids: []}

    assert_equal 'Job was saved successfully.', flash[:notice]
    assert_response :redirect
  end

  test "#update sucessfully" do
    job = jobs(:no_caller)
    post(:update, id: job.id,
     job: { type_id: job.type_id }
     )
    assert_redirected_to job
    assert_equal 'Job was successfully updated.', flash[:notice]
  end

  test "#update without company" do
    post(:update, id: @job.id,
     job: { type_id: @job.type_id },
     company: { name: '' }
     )
    assert_redirected_to @job
    assert_equal 'Job was successfully updated.', flash[:notice]
  end

  test '#collections' do
    get :collections
    assert_equal [], JSON.parse(response.body)
  end

  test '#reconciliation_form' do
    job = jobs(:one)
    get :reconciliation_form, job_id: job.id
    assert_response :success
  end
end
