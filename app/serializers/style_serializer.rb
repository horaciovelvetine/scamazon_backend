class StyleSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :shopping_cart
  attributes :price, :quantity

  
end