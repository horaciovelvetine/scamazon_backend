class Seed < ApplicationRecord


  def self.initiate_seeding(x, y)
    if y == 0 
      y = rand(1..50)
    end
    x.times { populate_loop(y) }
  end


  def self.populate_loop(y)
    @user = create_user
    3.times { create_list(@user)}
    
    create_store_with_inventory(@user)
    y.times {create_item(@user.store.inventory)}

    binding.pry

  end




  def self.create_user
    user = User.create(full_name: Faker::Name.name, email: Faker::Internet.unique.email , phone: Faker::PhoneNumber.cell_phone, password: 'default')
    
    user.create_wallet(name: "#{user.full_name}'s Wallet")
    
    address = user.addresses.create(street: Faker::Address.street_address, unit: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip)
    
    user.wallet.accounts.create(issued_by: Faker::Stripe.valid_token, number: Faker::Stripe.valid_card, expires: "#{Faker::Stripe.month}/#{Faker::Stripe.year}", ccv: Faker::Stripe.ccv, address: address, name_on: user.full_name)
    user.create_shopping_cart
    return user
  end
  
  def self.create_list(user)
    list = user.lists.create(name: Faker::Commerce.department, description: Faker::Hipster.paragraph(sentence_count: 1))
  end


  def self.create_store_with_inventory(user)
    store = user.create_store(name: Faker::Company.name, email: Faker::Internet.unique.email, description: Faker::Hipster.paragraph(sentence_count: 3), logo: Faker::Company.logo, industry:Faker::Company.industry, mission_statement: Faker::Company.catch_phrase, ein: Faker::Company.unique.ein)
    store.create_inventory
    binding.pry
  end

  def self.create_item(inventory)
    # rand_category = Categories.all.order("RANDOM()").first
    
    # item = inventory.items.create(name: Faker::Commerce.unique.product_name, sku: Faker::Number.unique.number(digits: 10), description: Faker::Hipster.paragraph(sentence_count: 12), price: Faker::Commerce.price, manufacturer: Faker::Commerce.vendor, country_origin: Faker::Address.country, category: rand_category)
    
    # rand(1..5).times { create_styles(item)}
    binding.pry
  end

  def self.create_styles(item)
    # col = Faker::Commerce.color
    # mat = Faker::Commerce.material
    # style = item.styles.create(name: "#{col} #{mat}", model: Faker::Company.duns_number, color: col, material: mat, quantity: rand(1..50), weight: Faker::Measurement.weight, dimensions: "#{Faker::Measurement.length} x #{Faker::Measurement.height} x #{Faker::Measurement.length")
    binding.pry
  end




end

