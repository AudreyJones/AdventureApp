class Adventure < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    validates :description, presence: true
    belongs_to :franchise
    belongs_to :user
    belongs_to :villain


    def self.search(search)
        # binding.pry
        if search
            @adventures = self.where('name like ?', "%#{search}%")
        elsif search == nil
            @adventures = Adventure.all
        else
            @adventures = Adventure.all
        end
    end

    
end
