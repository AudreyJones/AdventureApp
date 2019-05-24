class Adventure < ApplicationRecord
    validates: :name, presence: true
    belongs_to :franchise
    belongs_to :user
    belongs_to :villain


    # Examples of Scope Methods:
    scope :order_by_date, -> {order("created_at  ?")}
    scope :created_search, -> (search_date) {where("created_at = ?", search_date)}
end
