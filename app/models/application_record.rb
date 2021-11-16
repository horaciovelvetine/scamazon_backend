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
    ## Where self == ShoppingCart or Order

    styles.each_with_index do |style, i|

      ## Checkes if enough of that style quantity to self the desired quantity, duplicates and saves new style with correct quantities for it and the original.
      if style.quantity < quantities[i]
        duplicate_style = style.dup
        style.quantity = 0
      else
        duplicate_style = style.dup
        duplicate_style.quantity = quantities[i]
        style.quantity -= quantities[i]
      end  

      ## Adds style to self (Shopping_cart or Order)
      self.styles << duplicate_style
      

      ## Informs the duplicate style of its associated self
      case self
      when self.class == Order
        duplicate_style.order = self
      when self.class == ShoppingCart
        duplicate_style.shopping_cart = self
      end

    end
    
  end
end