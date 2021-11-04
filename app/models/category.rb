class Category < ApplicationRecord
  has_and_belongs_to_many :items
  has_and_belongs_to_many :searches
end
