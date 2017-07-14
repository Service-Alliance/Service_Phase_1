class ShareController < ApplicationController
    def users
        render json: User.all
    end
end
