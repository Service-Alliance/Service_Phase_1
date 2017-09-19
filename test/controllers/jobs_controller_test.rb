require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup { sign_in(users(:one)) }

  test "#update sucessfully" do
    job = jobs(:no_caller)
    post(:update, id: job.id,
         job: { type_id: job.type_id }
    )
    assert_redirected_to job
    assert_equal 'Job was successfully updated.', flash[:notice]
    end

  test "#update without company" do
    job = jobs(:one)

    post(:update, id: job.id,
         job: { type_id: job.type_id },
         company: { name: '' }
    )
    assert_redirected_to job
    assert_equal 'Job was successfully updated.', flash[:notice]
  end


  test '#collections' do
    get :collections
    assert_equal [], JSON.parse(response.body)
  end
end
