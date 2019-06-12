class FranchiseSerializer < ActiveModel::Serializer
  attributes :id, :name, :company, :created_at
  # Associations
  has_many :adventures
  has_many :users, through: :adventures
  has_many :villains, through: :adventures
end
