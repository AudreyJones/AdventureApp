class Villain < ApplicationRecord
    has_many :adventures
    has_many :heroes, through: :adventures
    has_many :franchises, through: :adventures
end
