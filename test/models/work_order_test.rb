require 'test_helper'

class WorkOrderTest < ActiveSupport::TestCase
  def setup
    @work_order = work_orders(:one)
  end

  test '#franchise_address_without_county' do
    assert_nil @work_order.franchise_address_without_county
  end


  test "job_manager_contact_info" do
    assert_equal [users(:one).full_name], @work_order.job_manager_contact_info
  end

  test '#build_from_job' do
    job = jobs(:one)
    work_order = WorkOrder.build_from_job(job, users(:one).full_name)

    assert_equal job, work_order.job
    assert_equal users(:one).full_name, work_order.typed_by
    assert_nil work_order.name
    assert_equal job.name, work_order.job_name
    assert_nil work_order.telephone
    assert_equal job.customer_full_name, work_order.contact
    assert_nil work_order.insurance
    assert_nil work_order.adjuster
    refute_nil work_order.claim_number
    assert_nil work_order.referral
    assert_equal job.customer.address_without_county, work_order.job_location
  end


  test '#location from customer address without county' do
    assert_equal work_orders(:one).job_location, work_orders(:one).location
    assert_equal work_orders(:without_location).customer_address_without_county, work_orders(:without_location).location
  end
end
