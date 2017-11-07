class WorkOrderPresenter < BasePresenter
  include ActionView::Helpers

  def display_crew
    display_total_crew
  end

  def hours_for_collection
    [['2 hours', 2], ['1/2 Man Day (4 hours)', 4], ['6 Hours', 6], ['Man Day (8 hours)', 8]]
  end

  private

  def display_total_crew
    [display_number_of_crew_chiefs, display_number_of_technicians].delete_if(&:blank?).join(' and ')
  end

  def display_number_of_technicians
    number_of_technicians.nil? ? "" : pluralize(number_of_technicians, "technician")
  end

  def display_number_of_crew_chiefs
    number_of_crew_chiefs.nil? ? "" : pluralize(number_of_crew_chiefs, "crew chief")
  end
end
