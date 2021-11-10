class Style < ApplicationRecord
  belongs_to :item
  belongs_to :order, optional: true
  belongs_to :shopping_cart, optional: true
  belongs_to :return, optional: true

    #Validations
  validates_format_of :sku, :with => /[0-9]{10}/
  validates_uniqueness_of :sku
end
