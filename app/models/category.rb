class Category < ApplicationRecord
  has_many :searches, :items
end
