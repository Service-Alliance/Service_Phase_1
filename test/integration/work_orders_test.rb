require 'integration_helper'

class WorkOrdersTest < Capybara::Rails::TestCase
  def setup
    set_up_js_test
    sign_in users(:one)
  end

  test 'can raise draft work order' do
    visit job_path(jobs(:one))
    find('#work_order_link').click
    within '#new_work_order' do
      assert_difference 'WorkOrder.count' do
        find('input[name="commit"]').click
      end
    end
    wo = WorkOrder.last
    assert wo.draft?
  end

  test 'can publish work order' do
    visit edit_job_work_order_path(job_id: work_orders(:draft).job, id: work_orders(:draft))
    find('input[name="commit"][value="Publish Work Order"]').click
    work_orders(:draft).reload
    assert work_orders(:draft).published?
  end
end
