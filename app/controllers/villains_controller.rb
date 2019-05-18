class VillainsController < ApplicationController
    def index

    end

    def show
        @villain = Villain.find_by_id(params[:id])
    end
    
    def new
        flash[:alert] = "What are you doing?! You're a HERO, you shouldn't be creating more villains...Job security, I guess."
        render :index
    end

    def create
        @villain = Villain.new(franchise_params)
        # binding.pry
        if !@villain.valid?
            flash[:alert] = "Villain info invalid"
            render :new
        else
            @villain.save
            redirect_to franchise_path(@villain)
        end
    end

    def edit
        @villain = Villain.find_by_id(params[:id])
    end

    def destroy

    end
    private

    def franchise_params
        params.require(:villain).permit(:name, :abilities, :catchphrase)
    end
end
