class Wallet < ApplicationRecord
  belongs_to :user
  has_many :accounts, :gift_cards
end
