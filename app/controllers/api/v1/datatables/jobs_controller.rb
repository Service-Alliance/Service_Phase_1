module Api
  module V1
    module Datatables
      class JobsController < DatatablesController
        private

        def set_datatable
          @dt = JobsDatatable.new
        end
      end
    end
  end
end
