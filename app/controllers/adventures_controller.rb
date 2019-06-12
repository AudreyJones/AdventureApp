class AdventuresController < ApplicationController
    before_action :set_adventure, only: [:show, :update, :edit, :destroy]
    def index
        @adventures = Adventure.all
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @adventures }
        end
    end
    
    def new
        if !user_signed_in?
            flash[:alert] = "I'm sorry, please log in the create an adventure!"
            redirect_to root_path
        elsif user_signed_in? && !(params.include?(:franchise_id))# Coming through directly - adventures index
            @adventure = Adventure.new
        else # Coming through indirectly - Franchise Index
            @franchise = Franchise.find_by_id(params[:franchise_id])
            @adventure = @franchise.adventures.build
        end
    end

    def create
        @franchise = Franchise.find_by_id(params[:adventure][:franchise_id])
        @adventure = @franchise.adventures.build(adventure_params)
        
        if !@adventure.valid?
            errors = []
            @adventure.errors.full_messages.each do |msg|
                errors << msg
            end
            redirect_to new_adventure_path, alert: errors.join(", ")
        else
            @adventure.save
            redirect_to adventure_path(@adventure)
        end
    end

    def show
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @adventures }
        end
    end

    def edit

    end

    def update
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
        @adventure.destroy
        redirect_to adventures_path, notice: "Your adventure was deleted!"
    end

    private

    def adventure_params
        params.require(:adventure).permit(:name, :location, :franchise_id, :user_id, :villain_id, :description)
    end

    def set_adventure
        @adventure = Adventure.find_by_id(params[:id])
    end
end
