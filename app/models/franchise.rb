class Franchise < ApplicationRecord
# Associations
    has_many :adventures
    has_many :users, through: :adventures
    has_many :villains, through: :adventures
# Validations
    validates :name, presence: true
    validates :company, presence: true
    
end
