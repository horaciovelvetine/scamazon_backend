class CartSerializer
  include JSONAPI::Serializer

  has_many :items, :styles
  # has_one :related_items, :spon_items

  attribute :sub_total
  attribute :number_of_items, &:num_items
end
