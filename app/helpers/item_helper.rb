module ItemHelper

  def get_random_items
    @items = Item.find(Item.distinct.pluck(:id)).sample(20)
  end

  def get_random_item
    @items = get_random_items


    @item = @items.sample(1)
    # if @@item.exists?
  end
  
end
