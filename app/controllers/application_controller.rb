require 'pry'
class ApplicationController < ActionController::Base
    
    def home
        binding.pry
        @user
    end
end
