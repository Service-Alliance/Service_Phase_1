require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  setup do
    @job = jobs(:one)
    @caller = callers(:one)
    sign_in(users(:one))
  end

  test "#update scuessfully" do
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
end
