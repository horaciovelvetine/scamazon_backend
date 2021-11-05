class Store < ApplicationRecord
  has_many: :items, through: :inventory, dependent: :destroy
end
