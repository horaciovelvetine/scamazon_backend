class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :rating

  attribute :number_of_reviews do |item|
    item.reviews.length
  end

  belongs_to :cart
end