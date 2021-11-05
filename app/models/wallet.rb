class Wallet < ApplicationRecord
  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :gift_cards
end
