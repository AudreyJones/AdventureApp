class Hero < ApplicationRecord
    has_many :adventures
    has_many :villains, through: :adventures
    has_many :franchises, through: :adventures
end
