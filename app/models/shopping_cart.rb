class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :styles


  #Iterates over carts styles, checks the quantity in the cart, and adds that to the attribute
  def update_number_of_items
    self.num_items = 0 
    self.styles.each do |style|
      self.num_items += style.quantity
    end
  end


end

