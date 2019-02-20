class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    before_action :redirect_subdomain, :check_user, :get_title

    def get_title
        @title = Proc.new do
            if @book
                @book.title
            elsif @post
                @post.title
            else
                "Direito Certo"
            end
        end
    end

    def check_user
        @admin = current_admin_user
    end

    def redirect_subdomain
        if request.host == 'www.direitocerto.com'
            redirect_to 'https://direitocerto.com' + request.fullpath, :status => 301
        end
    end
end
