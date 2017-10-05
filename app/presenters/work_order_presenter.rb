class WorkOrderPresenter < BasePresenter
  include ActionView::Helpers

  def display_crew
    number_of_technicians.present? || number_of_crew_chiefs.present? ? display_total_crew : crew
  end

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
