class VillainSerializer < ActiveModel::Serializer
  attributes :id, :name, :abilities, :catchphrase
# Associations
  has_many :adventures
  has_many :users, through: :adventures
  has_many :franchises, through: :adventures
end
