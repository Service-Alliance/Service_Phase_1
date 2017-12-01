class Api::V1::Datatables::JobsController < Api::V1::ApiController
  def index
    @dt = JobsDatatable.new
    @dt.query(params)
  end
end
