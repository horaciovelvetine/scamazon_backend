class Seed < ApplicationRecord


  def self.initiate_seeding(x, y)
    if y == 0 
      y = rand(1..50)
    end
    x.times { populate_loop(y) }
  end


  def self.populate_loop(y)
    @user = create_user
    @list1 = create_list(@user)
    @list2 = create_list(@user)

    binding.pry
    
    @store = create_store(@user)
    y.times {create_item(@store.inventory)}

    binding.pry





  end




  def self.create_user
    binding.pry
    # user = User.create(full_name: Faker::Name.name, email: Faker::Internet.unique.email , phone: Faker::PhoneNumber.cell_phone, password: 'default')
    # wallet = user.wallet.create(name: "#{user.full_name}'s Wallet")
    # address = user.address.create(street: Faker::Address.street_address, unit: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip)
    # account = wallet.accounts.create(type: Faker::Stripe.valid_token, number: Faker::Stripe.valid_card, expires: "#{Faker::Stripe.month}/#{Faker::Stripe.year}", security_code: Faker::Stripe.ccv, address: address)
    
    
    
    sc = user.shopping_cart.create ###################################################################################
    ####<------- This should add all of the default values to the cart and not need attributes so start there
    
    
    # return user
  end

  def self.create_store(user)
    binding.pry
    # store = user.store.create(name: Faker::Company.name,, email: Faker::Internet.unique.email, description: Faker::Hipster.paragraph(sentence_count: 3), logo: Faker::Company.logo, industry:Faker::Company.industry, mission_statement: Faker::Company.catch_phrase, ein: Faker::Company.unique.ein)
    # inventory = store.inventory.create
    # return store
  end

  def self.create_list(user)
    binding.pry
    # list = user.lists.create(name: Faker::Commerce.department, description: Faker::Hipster.paragraph(sentence_count: 1))
    # return list
  end

  def self.create_item(inventory)
    binding.pry
    # rand_category = Categories.all.order("RANDOM()").first
    
    # item = inventory.items.create(name: Faker::Commerce.unique.product_name, sku: Faker::Number.unique.number(digits: 10), description: Faker::Hipster.paragraph(sentence_count: 12), price: Faker::Commerce.price, manufacturer: Faker::Commerce.vendor, country_origin: Faker::Address.country, category: rand_category)

    # rand(1..5).times { create_styles(item)}
  end

  def self.create_styles(item)
    binding.pry
    # col = Faker::Commerce.color
    # mat = Faker::Commerce.material
    # style = item.styles.create(name: "#{col} #{mat}", model: Faker::Company.duns_number, color: col, material: mat, quantity: rand(1..50), weight: Faker::Measurement.weight, dimensions: "#{Faker::Measurement.length} x #{Faker::Measurement.height} x #{Faker::Measurement.length")
  end




end

