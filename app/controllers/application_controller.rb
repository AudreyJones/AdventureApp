class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def home
        if user_signed_in?
            render '/devise/registrations/dashboard'
        else
            render :home
        end
    end

    def dashboard
        render '/devise/registrations/dashboard'
    end

    def search
        @search = Villain.name_search(params[:search]) + Adventure.search(params[:search])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname, :abilities, :catchphrase])
    end
end
