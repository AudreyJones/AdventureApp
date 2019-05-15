require 'pry'
class RegistrationsController < Devise::RegistrationsController

    def show
        binding.pry
        if user_signed_in?
            @user = User.find_by_id(params[:user_id])
               render '/homepage'
        
            #     #Else, do nothing
        end
    end
private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :abilities, :catchphrase)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :abilities, :catchphrase)
    end



end