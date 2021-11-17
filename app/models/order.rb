class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  
  has_and_belongs_to_many :items

  has_many :stores, through: :items
  has_many :styles
  has_many :returns

  validates :items, :length => {minimum: 1}

  def calculate_grand_total
    self.grand_total = self.sub_total + self.shipping_cost
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
