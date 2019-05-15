class Adventure < ApplicationRecord
    belongs_to :franchise
    belongs_to :user
    belongs_to :villain
end
