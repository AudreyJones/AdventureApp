class Villain < ApplicationRecord
# Associations
    has_many :adventures
    has_many :users, through: :adventures
    has_many :franchises, through: :adventures
# Validations
    validates :name, presence: true
    validates :abilities, presence: true
    validates :catchphrase, presence: true

# Group Villains with a certain ability, or maybe alphabetically?
    # scope :ability, -> (villain) {joins.(:adventures).where('adventures.villains = ?', villain)}
    def self.search(search)
        # binding.pry
        if search
            @villains = self.where('abilities like ?', "%#{search}%")
        elsif search == nil
            @villains = Villain.all
        else
            @villains = Villain.all
        end
    end
end
