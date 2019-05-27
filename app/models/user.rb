class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]
# Associations
  has_many :adventures
  has_many :villains, through: :adventures
  has_many :franchises, through: :adventures

# Validations
  # validates :name, presence: true
  # validates :abilities, presence: true
  # validates :catchphrase, presence: true

# OmniAuth class-method
  def self.from_omniauth(auth)
    # binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.first_name = auth.info.name
    user.last_name = " "
    user.nickname = "Edit your account to add a nickname"
    user.uid = auth.uid
    user.abilities = "Edit your account to add abilities"
    user.catchphrase = "Edit your account to add a catchphrase"
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end
  end
end
