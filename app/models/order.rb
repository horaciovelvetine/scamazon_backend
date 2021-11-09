class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  has_many :items
  has_many :stores, through: :items
  has_many :styles, class_name: :items_styles

  validates :items, :length => {minimum: 1}


  #calculates the sub totals based on all item prices
  def calculate_sub_total
    self.items.each do |item|
      self.sub_total += item.price
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
