class VillainsController < ApplicationController
    before_action :set_villain, only: [:show]

    def index
        @villains = Villain.search(params[:search])
    end
    

    def show
        
    end
    
    def new
        if !user_signed_in?
            redirect_to villains_path, notice: "Sorry, you must log in to create a villain"
        else
            render :index, alert: "What are you doing?! You're a HERO, you shouldn't be creating more villains...Job security, I guess."
        end
    end

    private

    def villain_params
        params.require(:villain).permit(:name, :abilities, :catchphrase, :search)
    end

    def set_villain
        @villain = Villain.find_by_id(params[:id])
    end
end
