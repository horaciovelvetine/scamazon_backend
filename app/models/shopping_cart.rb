class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true
  
  has_many :styles
  
  has_and_belongs_to_many :items


  #Iterates over carts styles, checks the quantity in the cart, and adds that to the attribute
  def update_number_of_items
    self.num_items = 0 
    self.styles.each do |style|
      self.num_items += style.quantity
    end
  end

  def update_style_quantities(params)
    update_hash = {}
    params[:cartItems].each do |item|
      binding.pry
      update_hash.store(item[:id], item[:quantity])
    end

    update_hash.each_pair{|id, q| Style.find(id).quantity = q}
    binding.pry
  end



end

