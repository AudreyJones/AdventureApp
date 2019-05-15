class Adventure < ApplicationRecord
    belongs_to :franchise
    belongs_to :hero
    belongs_to :villain
end
