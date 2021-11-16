class SponItemSerializer
  include JSONAPI::Serializer

  has_many :items do 


  ## doesnt make sense here, saving for alter
  # attribute :price_range do |item|
  #   ## Checks the number of styles an item has, if 1 returns that single price as the price range
  #   if item.styles.length == 1
  #     item.styles.first.price
  #   else
  #     item.styles.map {|style| style.price}.minmax
  #   end
  # end
end