class Franchise < ApplicationRecord
    has_many :adventures
    has_many :users, through: :adventures
    has_many :villains, through: :adventures
end
