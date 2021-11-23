class ShoppingCartSerializer
  include JSONAPI::Serializer
  set_type :shopping_cart
  set_id :user_id
  attribute :number_of_items, &:num_items

  
  attribute :sub_total

  ## Array of specially formatted items for providing info needed to display a combo of style/item info
  attribute :cart_items do |cart|
    cart_items = cart.items.each_with_index.map { |item, i| {id: cart.styles[i].id, item_name: item.name.titleize, style_name: cart.styles[i].name.titleize, rating: item.rating, number_of_reviews: item.reviews.length, price: cart.styles[i].price, quantity: cart.styles[i].quantity, manufacturer: cart.styles[i].manufacturer.titleize} } 
  end

  ## Array of items related to current items in cart by
  attribute :related_items do |cart|
    item_bucket = []

    cart.items.each do |item|
      item.category.items.take(10).each do |rel_item|
        item_bucket << rel_item unless item_bucket.include?(rel_item)
      end
    end
    
    related_items = item_bucket.map { |i| {id: i.id, name: i.name.titleize, category: i.category.name.titleize, rating: i.rating, number_of_reviews: i.reviews.length, price: price_range(i)} }
  
  end

  ## Array of random items w/ relevant info
  attribute :sponsored_items do |cart|
    sponsored_items = Item.all.order("RANDOM()").take(6).map { |i| {id: i.id, name: i.name.titleize, rating: i.rating, number_of_reviews: i.reviews.length, price: price_range(i), styles: style_formatter(i)} }
  end
  
  ## Checks if an items/styles to find and return either a single or range price for an item display
  def self.price_range(item)
  
    if item.styles.length == 1
      item.styles.first.price
    else
      item.styles.map {|style| style.price}.minmax.uniq
    end
  end

  def self.style_formatter(item)
    @all_styles = item.styles.map {|style| {id: style.id, name: style.name.titleize, manufacturer: style.manufacturer, price: style.price }}
    if @all_styles.length > 1
      @unique_styles = @all_styles.map{|s| s}.uniq!{ |style| style[:name]}
      if @unique_styles.nil?
        return @all_styles
      end
      return @unique_styles
    end
    return @all_styles

  end


end
