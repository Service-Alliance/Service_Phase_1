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
    assert wo.draft?, "work order has been created in published state"
  end

  test 'can publish work order' do
    work_order = work_orders(:draft)
    visit edit_job_work_order_path(job_id: work_order.job, id: work_order)
    find('input[name="commit"][value="Publish Work Order"]').click
    work_order.reload
    assert work_order.published?, "work order is draft when it should be published"
  end

  test 'can archive work order' do
    work_order = work_orders(:draft)
    visit job_work_order_path(job_id: work_order.job, id: work_order)
    click_link 'Archive'
    assert_content 'Work Order has been archived' 
    work_order.reload
    assert work_order.archived?, 'work order is not archived when it should be'
  end

  test 'can delete archived work order' do
    work_order = work_orders(:archived)
    visit job_work_order_path(job_id: work_order.job, id: work_order)
    click_link 'Delete'
    assert_content 'Work Order has been deleted' 
    assert_nil WorkOrder.find_by(id: work_order.id)
  end

  test 'can unarchive archived work order' do
    work_order = work_orders(:archived)
    visit job_work_order_path(job_id: work_order.job, id: work_order)
    click_link 'Unarchive'
    assert_content 'Work Order has been unarchived' 
    work_order.reload
    assert work_order.active?, 'work order is archived when it should not be'
  end
end
