require 'pry'
class RegistrationsController < Devise::RegistrationsController


    def homepage
        
    end

    # def after_sign_out_path_for(users)
    #     redirect_to 'application#home'
    # end
    # def 

private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :abilities, :catchphrase)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :abilities, :catchphrase)
    end
end