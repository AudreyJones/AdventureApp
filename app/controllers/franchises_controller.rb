class FranchisesController < ApplicationController
    before_action :set_franchise, only: [:show]
    def index

    end

    def show
    
    end
    
    private

    def set_franchise
        @franchise = Franchise.find_by_id(params[:id])
    end
end
