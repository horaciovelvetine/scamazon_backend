class ShoppingCartSerializer
  include JSONAPI::Serializer
  set_type :shopping_cart
  set_id :user_id
  attribute :number_of_items, &:num_items

  attribute :sub_total

  attribute :cart_items do |cart|
    cart_items = cart.items.each_with_index.map { |item, i| {id: item.id, name: "#{item.name}", rating: item.rating, number_of_reviews: item.reviews.length, price: cart.styles[i].price.to_i, quantity: cart.styles[i].quantity}} 
  end

  attribute :related_items do |cart|
    item_bucket = []

    cart.items.each do |item|
      item.category.items.take(10).each do |rel_item|
        item_bucket << rel_item unless item_bucket.include?(rel_item)
      end
    end
    
    related_items = item_bucket.map {|i| {id: i.id, name: "#{i.name}", category: "#{i.category.name}", rating: i.rating, number_of_reviews: i.reviews.length, price: i.styles.map{|s| s.price.to_i}.minmax} }
    

  end

  attribute :sponsored_items do |cart|
    sponsored_items = Item.all.order("RANDOM()").take(6).map {|i| {id: i.id, name: "#{i.name}", rating: i.rating, number_of_review: i.reviews.length, price: i.styles.map{|s| s.price.to_i}.minmax}}
  end




  attributes :items, :styles


end
