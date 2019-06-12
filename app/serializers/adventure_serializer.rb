class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :name, :location
  # Associations
  belongs_to :franchise
  belongs_to :user
  belongs_to :villain
end
