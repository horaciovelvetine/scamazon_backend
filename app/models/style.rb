class Style < ApplicationRecord
  belongs_to :item
  belongs_to :order, optional: true
  belongs_to :shopping_cart, optional: true
  belongs_to :return, optional: true
end
