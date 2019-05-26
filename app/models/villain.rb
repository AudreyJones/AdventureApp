class Villain < ApplicationRecord
    validates :name, presence: true
    validates :abilities, presence: true
    validates :catchphrase, presence: true
    has_many :adventures
    has_many :users, through: :adventures
    has_many :franchises, through: :adventures

    scope :franchise, -> (villain) {joins.(:adventures).where('adventures.villains = ?', villain)}
end
