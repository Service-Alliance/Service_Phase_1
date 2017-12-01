class Api::V1::Datatables::DatatablesController < Api::V1::ApiController
  before_filter :set_datatable

  def index
    @dt.query(params)
  end
end
