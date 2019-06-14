class AdventureSerializer < ActiveModel::Serializer
  attributes :name, :location, :description
  # Associations
  belongs_to :franchise
  belongs_to :user
  belongs_to :villain
end
