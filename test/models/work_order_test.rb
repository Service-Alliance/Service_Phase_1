require 'test_helper'

class WorkOrderTest < ActiveSupport::TestCase
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
