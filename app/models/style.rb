class Style < ApplicationRecord
  belongs_to :item
  belongs_to :order, :shopping_cart, :return, optional: true

    #Validations
  validates_format_of :sku, :with => /[0-9]{10}/
end
