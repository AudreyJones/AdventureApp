class FranchisesController < ApplicationController
    before_action :set_franchise, only: [:show]
    def index

    end

    def show
    
    end
    
# Franchises are permanent and unable to be edited by the user
    # def new
    #     @franchise = Franchise.new
    # end

    # def create
    #     @franchise = Franchise.new(franchise_params)
    #     # binding.pry
    #     if !@franchise.valid?
    #         flash[:alert] = "Franchise info invalid"
    #         render :new
    #     else
    #         @franchise.save
    #         redirect_to franchise_path(@franchise)
    #     end
    # end

    
    private

    # def franchise_params
    #     params.require(:adventure).permit(:name, :company)
    # end

    def set_franchise
        @franchise = Franchise.find_by_id(params[:id])
    end
end
