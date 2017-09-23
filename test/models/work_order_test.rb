require 'test_helper'

class WorkOrderTest < ActiveSupport::TestCase
  setup do
    @work_order = work_orders(:one)
  end

  test '#franchise_address_without_county' do
    assert_nil @work_order.franchise_address_without_county
  end

  test "to returns SERVPRO without 'of franchise' if no franchise" do
    work_order = work_orders(:one)
    work_order.job.franchise = nil
    assert_equal ['SERVPRO'], work_order.to
  end

  test "job_manager_contact_info" do
    assert_equal [nil], @work_order.job_manager_contact_info
  end

  test 'to returns SERVPRO if no vendors' do
    to = work_orders(:one).to
    assert_equal ['SERVPRO of FranchiseOne'], to
  end

  test 'to returns just the vendor if only one vendor' do
    work_orders(:one).vendors << vendors(:one)
    assert_equal [vendors(:one).name], work_orders(:one).to
  end

  test 'to returns SERVPRO plus all vendors if more than one vendor' do
    work_orders(:one).vendors << vendors(:one)
    work_orders(:one).vendors << vendors(:two)
    assert_includes work_orders(:one).to, 'SERVPRO of FranchiseOne'
    assert_includes work_orders(:one).to, vendors(:one).name
    assert_includes work_orders(:one).to, vendors(:two).name
  end
end
