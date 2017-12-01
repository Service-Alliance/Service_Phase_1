class Api::V1::Datatables::JobsController < DatatablesController
  private

  def set_datatable
    @dt = JobsDatatable.new
  end
end
