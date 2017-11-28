require 'test_helper'

class WorkOrderPresenterTest < ActiveSupport::TestCase
  def setup
    @work_order = work_orders(:one)
    @presenter = WorkOrderPresenter.new(@work_order, nil)
  end

  test "#display_crew displays both technicians if both present" do
    @work_order.number_of_technicians = 3
    @work_order.number_of_crew_chiefs = 1
    assert_equal("1 Crew Chief and 3 Technicians", @presenter.display_crew)
  end

  test "#display_crew only displays one if only one present" do
    @work_order.number_of_technicians = 3
    assert_equal("3 Technicians", @presenter.display_crew)
    @work_order.number_of_technicians = nil
    @work_order.number_of_crew_chiefs = 3
    assert_equal("3 Crew Chiefs", @presenter.display_crew)
  end
end
