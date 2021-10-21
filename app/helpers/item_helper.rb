module ItemHelper

  def explore_more_item
    @item = Item.all.sample
  end

  def set_item(item)
    @item = item
  end
  
end
