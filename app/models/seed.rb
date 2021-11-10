class Seed < ApplicationRecord


  def self.initiate_seeding(x, y)
    x.times { populate_loop(y) }
  end
  
  
  def self.populate_loop(y)
    if y == 0 
      y = rand(1..20)
    end
    @user = create_user
    
    create_store_with_inventory(@user)
    y.times {create_item(@user.store.inventory)}
    
    2.times { create_list(@user)}
    3.times{ create_orders_for_user(@user)}
  end




  def self.create_user
    user = User.create(full_name: Faker::Name.name, email: Faker::Internet.unique.email , phone: Faker::PhoneNumber.cell_phone, password: 'default')
    
    user.create_wallet(name: "#{user.full_name}'s Wallet")
    
    address = user.addresses.create(street: Faker::Address.street_address, unit: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip)
    
    user.wallet.accounts.create(issued_by: Faker::Stripe.valid_token, number: Faker::Stripe.valid_card, expires: "#{Faker::Stripe.month}/#{Faker::Stripe.year}", ccv: Faker::Stripe.ccv, address: address, name_on: user.full_name)
    user.create_shopping_cart
    return user
  end
  
  
  
  def self.create_store_with_inventory(user)
    store = user.create_store(name: Faker::Company.name, email: Faker::Internet.unique.email, description: Faker::Hipster.paragraph(sentence_count: 3), logo: Faker::Company.logo, industry:Faker::Company.industry, mission_statement: Faker::Company.catch_phrase, ein: Faker::Company.unique.ein)
    store.create_inventory
  end
  
  def self.create_item(inventory)
    item = inventory.items.create(name: Faker::Commerce.unique.product_name,  description: Faker::Hipster.paragraph(sentence_count: 12),  category: Category.all.order("RANDOM()").first)
    
    rand(1..5).times {create_styles(item)}
  end
  
  def self.create_styles(item)
    col = Faker::Commerce.color
    mat = Faker::Commerce.material
    style = item.styles.create(name: "#{col} #{mat}", model: Faker::Company.duns_number, sku: Faker::Number.unique.number(digits: 10), price: Faker::Commerce.price,color: col, material: mat, quantity: rand(1..50), weight: Faker::Measurement.weight, manufacturer: Faker::Commerce.vendor, country_origin: Faker::Address.country, dimensions: "#{Faker::Measurement.length} x #{Faker::Measurement.height} x #{Faker::Measurement.length}")
  end

  def self.create_list(user)
    list = user.lists.create(name: Faker::Commerce.department, description: Faker::Hipster.paragraph(sentence_count: 1))
    @items = Item.all.order("RANDOM()").take(rand(5..10))
    list.add_items(@items)
  end
  

  ## Creates dummy order with: Items, Styles, Random Attr info, updates all styles to correct quantities (removes store quantity, and adds to creates duplicate style belonging to order instead with quantity ordered). 
  def self.create_orders_for_user(user)
    
    #grabs sample item/style info from database to create Order
    @items = Item.all.order("RANDOM()").take(rand(2..5))
    styles = @items.map { |i| i.styles.order("RANDOM()").first }
    quantities = Array.new(@items.length) { rand(1..3) }
    

    #grabs and creates information to populate new order
    ship_info = {shipped_on: Faker::Date.between(from: 5.days.ago, to: Date.today), info: "via Scamazon Shipping"}
    tracking = Faker::Invoice.reference
    status = Status.find_by_name("Delivered")    

    #Creates order associated to that user
    order = user.orders.new
    

    #Call all order update methods to assign info to order
    order.add_items(@items)
    order.add_update_and_duplicate_styles(styles, quantities)
    order.update_shipping_info(ship_info)
    order.tracking_info = tracking
    order.status = status
    order.calculate_sub_total
    order.calculate_grand_total
    order.save

  end

end

