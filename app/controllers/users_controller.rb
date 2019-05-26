class UsersController < ApplicationController

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        # binding.pry
        @user.update(special_user_params)
        render '/devise/registrations/dashboard'
    end

    private

    def special_user_params
        params.require(:user).permit(:catchphrase, :abilities)
    end

end