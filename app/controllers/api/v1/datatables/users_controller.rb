module Api
  module V1
    module Datatables
      class UsersController < DatatablesController
        private

        def set_datatable
          @dt = UsersDatatable.new
        end
      end
    end
  end
end
