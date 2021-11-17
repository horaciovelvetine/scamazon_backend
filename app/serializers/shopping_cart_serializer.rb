class ShoppingCartSerializer
  include JSONAPI::Serializer
  set_type :shopping_cart
  set_id :user_id
  attribute :number_of_items, &:num_items

  attribute :sub_total

  # has_one :related_items, :spon_items
  attribute :cart_items do |cart|
    cart_items = cart.items.each_with_index.map { |item, i| {id: item.id, name: "#{item.name}", rating: item.rating, number_of_reviews: item.reviews.length, price: cart.styles[i].price.to_i, quantity: cart.styles[i].quantity}} 
  end

  attributes :items, :styles


end
