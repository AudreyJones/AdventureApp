require 'pry'
class AdventuresController < ApplicationController
    before_action :set_adventure, only: [:show, :update, :edit, :destroy]
    def index

    end
    
    def new
        if !user_signed_in?
            flash[:alert] = "I'm sorry, please log in the create an adventure!"
            redirect_to root_path
        # elsif 
            # Coming through directly - adventures_index
        else
            # Coming through the Franchise Index
            @franchise = Franchise.find_by_id(params[:franchise_id])
            @adventure = @franchise.adventures.build
        end
    end

    def create
        # binding.pry
        @franchise = Franchise.find_by_id(params[:adventure][:franchise_id])
        @adventure = @franchise.adventures.build(adventure_params)
        
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
        # Resolve logic to deal with situations
        @adventure.destroy
        # if @adventure != nil 
        #     flash[:alert] = "Adventure was not effectively deleted"
        #     render :show
        # else
            redirect_to adventures_path, notice: "Your adventure was deleted!"
        # end
    end

    private

    def adventure_params
        params.require(:adventure).permit(:name, :location, :franchise_id, :user_id, :villain_id, :description)
    end

    def set_adventure
        @adventure = Adventure.find_by_id(params[:id])
    end
end
