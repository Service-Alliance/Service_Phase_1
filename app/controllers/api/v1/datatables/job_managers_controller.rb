module Api
  module V1
    module Datatables
      class JobManagersController < DatatablesController
        private

        def set_datatable
          @dt = JobManagersDatatable.new
        end
      end
    end
  end
end
