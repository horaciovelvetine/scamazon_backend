module ItemHelper
  @@displayed_items = []

  def get_random_item
    
    @item = Item.distinct.sample
    until !@@displayed_items.include?(@item)
      @item = Item.distinct.sample
      
      if @@displayed_items.length == Item.count
        @@displayed_items = []
      end

    end
    @@displayed_items << @item
    
    return @item
  end

  def set_item(item)
    @item = item
  end
  
end
