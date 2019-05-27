class UsersController < ApplicationController

    def edit
        @user = current_user
    end

    def update
        empty_parameters = []
        
        if (params[:user][:nickname].empty?) || (params[:user][:catchphrase].empty?) || (params[:user][:abilities].empty?)
            params[:user].each do |key,value|
                if value.empty?
                    empty_parameters << key
                end
                empty_parameters
            end  
            redirect_to edit_user_path, alert:"You cannot leave #{empty_parameters.join(", ")} blank when editing"
        else
            @user = current_user
            @user.update(special_user_params)
            render '/devise/registrations/dashboard'
        end
    end

    private

    def special_user_params
        params.require(:user).permit(:catchphrase, :abilities, :nickname)
    end

end