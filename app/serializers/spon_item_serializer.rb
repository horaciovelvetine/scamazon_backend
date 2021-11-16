class SponItemSerializer
  include JSONAPI::Serializer

  has_many :items do 
end