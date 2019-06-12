class FranchisesController < ApplicationController
    before_action :set_franchise, only: [:show]
    def index
        @franchises = Franchise.all
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @franchises }
        end
    end

    def show
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @franchise }
        end
    end
    
    private

    def set_franchise
        @franchise = Franchise.find_by_id(params[:id])
    end
end
