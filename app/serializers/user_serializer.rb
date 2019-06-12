class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :nickname, :abilities, :catchphrase
# Associations
  has_many :adventures
  has_many :villains, through: :adventures
  has_many :franchises, through: :adventures
end
