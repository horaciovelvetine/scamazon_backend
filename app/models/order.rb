class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  has_many :items
  has_many :stores, through: :items
  has_many :styles

  validates :items, :length => {minimum: 1}


  #calculates the sub totals based on all item prices
  def calculate_sub_total
    self.styles.each do |style|
      self.sub_total += ((style.price) * style.quantity)
    end
  end

  def calculate_grand_total
    self.grand_total = self.sub_total + self.shipping_cost
  end


  #iterates over the items array provided and adds items to the order
  def add_items(items)
    if items.nil?
      binding.pry
    end
    items.each do |item|
      self.items << item
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


  #should take in info form store order update form, and update the order
  def update_shipping_info(info)
    self.shipping_info = info[:info]
    self.shipped_on = info[:shipped_on]
    self.shipping_cost = shipping_calculator(self)
  end


  #Eventually should take the order, check if slime free shipping,if not find address and calculate the cost from A to B. In demo will provide random price. 
  def shipping_calculator(order)
    if order.slime?
      return 0.00
    end
    return rand(5.99..28.99)
  end





end
