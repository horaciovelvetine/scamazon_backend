class Item < ApplicationRecord
  belongs_to :inventory
  belongs_to :category
end
