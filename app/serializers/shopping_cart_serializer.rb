class ShoppingCartSerializer
  include JSONAPI::Serializer
  set_type :shopping_cart
  set_id :user_id

  attribute :number_of_items, &:num_items
  attributes :sub_total, :items, :styles

  # has_one :related_items, :spon_items


end
