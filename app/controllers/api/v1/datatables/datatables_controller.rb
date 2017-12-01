module Api
  module V1
    module Datatables
      class DatatablesController < Api::V1::ApiController
        before_filter :set_datatable

        def index
          @dt.query(params)
        end
      end
    end
  end
end
