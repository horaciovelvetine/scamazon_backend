module ItemHelper

  def get_random_items
    @items = Item.find(Item.distinct.pluck(:id)).sample(20)
  end
  
end
