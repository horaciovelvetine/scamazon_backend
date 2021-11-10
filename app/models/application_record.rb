class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #iterates over the items array provided and adds items to the order
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
      #adds style to order
      self.styles << style
      
      #checkes if there are enough of that style to order the desired quantity, duplicates and saves new style with correct quantities for it and the original.
      if style.quantity < quantities[i]
        d = style.dup
        style.quantity = 0
        d.save
      else
        d = style.dup
        d.quantity = quantities[i]
        style.quantity -= quantities[i]
        d.save
      end      
    end
    
  end
end