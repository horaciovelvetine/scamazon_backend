module ItemHelper
  @@displayed_items = []
  
  def explore_more_item
    @item = Item.all.sample

    # if @@displayed_item.length == Item.alll.length
    #   @@displatyed_item = []
    # end

    # until !@@displayed_item.include?(@item)
    #   @item.all.sample
    # end
    

    # @@displayed_item << @item
    # return @item 

  end

  def set_item(item)
    @item = item
  end
  
end
