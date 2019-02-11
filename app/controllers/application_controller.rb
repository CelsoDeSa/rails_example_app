class ApplicationController < ActionController::Base
    before_action :redirect_subdomain

    def redirect_subdomain
        if request.host == 'www.direitocerto.com'
            redirect_to 'https://direitocerto.com' + request.fullpath, :status => 301
        end
    end
end
