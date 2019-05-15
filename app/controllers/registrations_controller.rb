require 'pry'
class RegistrationsController < Devise::RegistrationsController

    # def after_sign_out_path_for(users)
    #     redirect_to 'application#home'
    # end

private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :abilities, :catchphrase)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :abilities, :catchphrase)
    end
end