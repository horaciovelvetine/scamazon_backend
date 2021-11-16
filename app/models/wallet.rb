class Wallet < ApplicationRecord
  belongs_to :user
  
  has_many :accounts
  has_many :gift_cards
end
