class Style < ApplicationRecord
  belongs_to :item
  belongs_to :order, optional: true
end
