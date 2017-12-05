module Api
  module V1
    module Datatables
      class CallsController < DatatablesController
        private

        def set_datatable
          @dt = CallsDatatable.new
        end
      end
    end
  end
end
