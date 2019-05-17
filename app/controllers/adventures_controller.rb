require 'pry'
class AdventuresController < ApplicationController
    
    def index

    end
    
    def new
        # binding.pry
        @franchise = Franchise.find_by_id(params[:franchise_id])
        @adventure = Adventure.new
    end

    def create

    end

    def edit

    end

    def destroy

    end
end
