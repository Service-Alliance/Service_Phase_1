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

  test '#index filters on loss_type' do
    loss_type = loss_types(:fire)
    get :index, q: {losses_loss_type_id_in: [loss_type.id]}
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

  test '#reconciliation_form' do
    job = jobs(:one)
    get :reconciliation_form, job_id: job.id
    assert_response :success
  end

  test '#create_call creates call and tracker' do
    call = calls(:one)
    job = jobs(:one)
    assert_difference 'Tracker.count', 1 do
      post :create_call, id: job.id, call: {id: call.id, job_id: job.id, note: 'note'}
    end
    job.reload
    assert_includes job.calls, call
  end

  test '#manager_assignment creates assignment and tracker' do
    user = users(:one)
    job = jobs(:no_manager)
    assert_difference 'JobManager.count', 1 do
      assert_difference 'Tracker.count', 1 do
        get :manager_assignment, job_id: job.id, job_manager_id: user.id
      end
    end
    job.reload
    assert_equal job.job_managers.last.job_manager, user
  end

  test '#create_estimate creates estimate and tracker' do
    job = jobs(:no_manager)
    assert_difference 'Tracker.count', 1 do
      get :create_estimate, id: job.id
    end
    job.reload
    assert_equal job.estimate_created, true
    assert_equal Tracker.last.tracker_task.name, 'Estimate Created'
  end

  test '#create_estimate_sent sets estimate_sent and creates tracker' do
    job = jobs(:no_manager)
    assert_difference 'Tracker.count', 1 do
      get :create_estimate_sent, id: job.id
    end
    job.reload
    assert_equal job.estimate_sent, true
    assert_equal Tracker.last.tracker_task.name, 'Estimate Sent'
  end

  test '#create_contract creates contract and tracker' do
    job = jobs(:no_manager)
    assert_difference 'Tracker.count', 1 do
      get :create_contract, id: job.id
    end
    job.reload
    assert_equal job.contract_created, true
    assert_equal Tracker.last.tracker_task.name, 'Contract Created'
  end

  test '#create_contract_sent sets contract_sent and creates tracker' do
    job = jobs(:no_manager)
    assert_difference 'Tracker.count', 1 do
      get :create_contract_sent, id: job.id
    end
    job.reload
    assert_equal job.contract_sent, true
    assert_equal Tracker.last.tracker_task.name, 'Contract Sent'
  end
end
