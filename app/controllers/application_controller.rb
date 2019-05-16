require 'pry'
class ApplicationController < ActionController::Base
    
    def home
        if user_signed_in?
            render '/devise/registrations/homepage'
        else
            render :home
        end
    end
end
