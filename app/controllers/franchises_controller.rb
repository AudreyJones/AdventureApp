class FranchisesController < ApplicationController
    def index

    end

    def show
        @franchise = Franchise.find_by_id(params[:id])
    end
    
    def new

    end

    def create

    end

    def edit

    end

    def destroy

    end
end
