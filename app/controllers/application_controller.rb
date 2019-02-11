class ApplicationController < ActionController::Base
    before_action :redirect_subdomain, :check_user, :authenticate_admin_user!, only: [:new, :update, :destroy]

    def check_user
        @admin = current_admin_user
    end

    def redirect_subdomain
        if request.host == 'www.direitocerto.com'
            redirect_to 'https://direitocerto.com' + request.fullpath, :status => 301
        end
    end
end
