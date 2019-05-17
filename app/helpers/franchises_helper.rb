module FranchisesHelper
    def current_franchise
        @franchise = Franchise.find_by_id(params[:id])
    end
end
