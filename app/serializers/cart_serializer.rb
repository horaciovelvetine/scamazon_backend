class CartSerializer
  include JSONAPI::Serializer

  has_many :items, :styles
  has_one :related_items, :spon_items
end
