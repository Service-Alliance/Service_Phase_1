module Api
  module V1
    module Datatables
      class WorkOrdersController < DatatablesController
        private

        def set_datatable
          @dt = WorkOrdersDatatable.new
        end
      end
    end
  end
end
