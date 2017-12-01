class Api::V1::Datatables::WorkOrdersController < DatatablesController
  private

  def set_datatable
    @dt = WorkOrdersDatatable.new
  end
end
