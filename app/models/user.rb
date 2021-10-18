class User < ApplicationRecord
  # Devise attributes for:
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

  # Object Relationships
  has_many :reviews
  has_one :store
  has_many :orders
  has_many :items, through: :orders
  has_one :shopping_cart
  has_many :gift_cards
  has_many :lists


  def self.from_omniauth(auth)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|    
      user.first_name = auth.info.nickname && user.last_name = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.authorize_for_the_slime_time(user)
    user.slime = true
  end

  def self.add_balance(user, balance)
    
    if user.balance.nil?
      user.balance = 0
      user.balance += balance
    else
      user.balance += balance
    end

  end
end
