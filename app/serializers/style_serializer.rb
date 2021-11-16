class StyleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :price, :quantity
  
end