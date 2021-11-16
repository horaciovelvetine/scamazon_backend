class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #iterates over the items array provided and adds items to self (where self == any: shoppingCart, Order, List)
  def add_items(items)
    if items.nil?
      binding.pry
    end
    items.each do |item|
      self.items << item
    end
  end
  
  #calculates the sub totals based on all item prices
  def calculate_sub_total
    self.styles.each do |style|
      self.sub_total += ((style.price) * style.quantity)
    end
  end
  
  #iterates over an array of styles and, creates a new style to associate with that order, adds it to the order and updates the original style by removing the quantity ordered
  def add_update_and_duplicate_styles(styles, quantities)
    
    styles.each_with_index do |style, i|

      #checkes if there are enough of that style to order/add_to_cart the desired quantity, duplicates and saves new style with correct quantities for it and the original.
      if style.quantity < quantities[i]
        #if the quantity is less than ordered, creates a duplicate style (which has orig quantity), sets the orignal style's quantity to 0, and saves the duplicated style to self.
        duplicate_style = style.dup
        style.quantity = 0
      else
        duplicate_style = style.dup
        duplicate_style.quantity = quantities[i]
        style.quantity -= quantities[i]
      end  

      # Adds styles to self
      self.styles << duplicate_style
      binding.pry 
      # duplicate_style.self.parent = self
    end
    
  end
end