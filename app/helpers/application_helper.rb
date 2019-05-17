require 'pry'
module ApplicationHelper
    
    def user_abilities(user)
        current_user.abilities.split(",")
    end
end
