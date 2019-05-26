class Villain < ApplicationRecord
# Associations
    has_many :adventures
    has_many :users, through: :adventures
    has_many :franchises, through: :adventures
# Validations
    validates :name, presence: true
    validates :abilities, presence: true
    validates :catchphrase, presence: true

    # Possible select for villains with a certain ability
    scope :franchise, -> (villain) {joins.(:adventures).where('adventures.villains = ?', villain)}
end
