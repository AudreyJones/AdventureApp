class Franchise < ApplicationRecord
    validates :name, presence: true
    validates :company, presence: true
    has_many :adventures
    has_many :users, through: :adventures
    has_many :villains, through: :adventures
end
