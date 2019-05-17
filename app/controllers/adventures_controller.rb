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
        # binding.pry
        @adventure = Adventure.new
        @adventure.name = params[:adventure][:name]
        @adventure.location = params[:adventure][:location]
        @adventure.franchise_id = params[:adventure][:franchise_id]
        @adventure.villain_id = params[:adventure][:villain_id]
    #Need to validate against invalid data!
        @adventure.save
    end

    def show
        @adventure = Adventure.find_by_id(params[:id])
    end

    def edit

    end

    def destroy

    end
end
