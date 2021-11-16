class ItemSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :shopping_cart
  attributes :name, :rating

  attribute :number_of_reviews do |item|
    item.reviews.length
  end

end