require 'pry'
class AdventuresController < ApplicationController
    before_action :set_adventure, only: [:show, :update, :edit, :destroy]
    def index

    end
    
    def new
        @franchise = Franchise.find_by_id(params[:franchise_id])
        @adventure = Adventure.new
    end

    def create
        @adventure = Adventure.new(adventure_params)
        # binding.pry
        if !@adventure.valid?
            # Utilize .errors to access errors and post via alerts! Then send us to a page where we can try again.
            flash[:alert] = "NOPE"
            render :new
        else
            @adventure.save
            redirect_to adventure_path(@adventure)
        end
    end

    def show
        @adventure = Adventure.find_by_id(params[:id])
    end

    def edit
        @adventure = Adventure.find_by_id(params[:id])
    end

    def update
        @adventure = Adventure.find_by_id(params[:id])
        @adventure.update(adventure_params)
        if !@adventure.valid?
            flash[:alert] = "Invalid editing of Adventure"
            render :show
        else
            @adventure.save
            redirect_to adventure_path(@adventure)
        end
    end

    def destroy
        # binding.pry
        @adventure.destroy
        if @adventure != nil
            flash[:alert] = "Adventure was not effectively deleted"
            redirect_to 'adventure_path(@adventure)'
        else
            # binding.pry
            redirect_to 'adventures_path'
        end
    end

    private

    def adventure_params
        params.require(:adventure).permit(:name, :location, :franchise_id, :user_id, :villain_id, :description)
    end

    def set_adventure
        @adventure = Adventure.find_by_id(params[:id])
    end
end
