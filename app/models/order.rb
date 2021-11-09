class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  has_many :items
  has_many :stores, through: :items


  def calculate_sub_total
    #calculates the sub totals based on all item prices
    # self.items.each do |item|
    #   self.sub_total += item.price
    # end
    binding.pry
  end

  def add_items(items)
    #iterates over the returns array, and adds items to the order
    items.each do |item|
      self << item
    end
    binding.pry
  end

  def update_shipping_info(info)
    #should take in info form store form, and update the order
    # self.shipping_info = info[:info]
    # self.shipped_on = info[:shipped_on]
    # self.shipping_cost = shipping_calculator(self)
    binding.pry
  end

  def update_tracking_info(tracking)
    #Should take in tracking info to update the ordera
    self.tracking_info = tracking
    binding.pry
  end

  def shipping_calculator
    #Eventually should take the orders address and calculate the cost from A to B. In demo will provide random price. 
    if self.slime?
      return 0.00
    else
      rand(5.99..28.99)
    end
    binding.pry
  end

  def update_status(status_info)
    #should take in a status param match, find that status, and then add it to the order
    status = Status.find_by_name(status_info)
    if status.nil?
      #uhoh that didnt work
    else
      self.status = status
    end
  end




end
