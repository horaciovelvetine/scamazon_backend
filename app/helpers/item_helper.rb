module ItemHelper
  @@displayed_items = []

  def get_random_item
    
    @item = Item.distinct.sample
    until !@@displayed_items.include?(@item)
      @item = Item.distinct.sample
    end
    @@displayed_items << @item
    return @item
  end

end
