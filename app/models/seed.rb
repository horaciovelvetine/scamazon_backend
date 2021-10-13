class Seed < ApplicationRecord


  def self.populate_store(params)
    # Sets amount of times around loop
    @x = params[:quantities][:users].to_i
    @y = params[:quantities][:items].to_i
    @x.times {create_deep_user_loop(@y)}
  end


  def self.create_deep_user_loop(y)
    @user = create_user_sc
    @store = create_store_sc(@user)
    @inventory = create_inventory_sc(@store)

    if y == 0
      @y = rand(1..35)
    end
    @y.times {create_items_loop(@inventory)}

      
    if !@user.save or !@store.save or !@inventory.save
      #the uhoh that didnt seed zone. For rails db:seed's that dont work.
      binding.pry
    end
  end

    
  def self.create_items_loop(inventory)
    @item = create_item_sc(inventory)
    category_randomizer(@item)
    @item.inventory = inventory
    @item.save
  end

  def self.category_randomizer(item)
    
    Category.all.order("RANDOM()").limit(3).each do |category|
      item.categories << category
    end
  end

  def self.create_user_sc
    @user = User.create({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email , address: Faker::Address.full_address, phone: Faker::PhoneNumber.cell_phone, password: 'defaultpass', balance: 0 })
  end

  def self.create_store_sc(user)
    @store = user.create_store({ name: Faker::Company.name, email: Faker::Internet.unique.email, address: Faker::Address.full_address, description: Faker::Hipster.paragraph(sentence_count: 2), logo: Faker::Company.logo, industry: Faker::Company.industry, mission_statement: Faker::Company.catch_phrase, ein: Faker::Company.unique.ein })
  end

  def self.create_inventory_sc(store)
    @inventory = store.create_inventory({notes: Faker::Hipster.paragraph(sentence_count: 3)})
  end

  def self.create_item_sc(inventory)
    @item = Item.new({name: Faker::Commerce.unique.product_name, description: Faker::Hipster.paragraph(sentence_count: 6), model: Faker::Company.duns_number, manufacturer: Faker::Commerce.brand, country_of_origin: Faker::Address.country, picture: Faker::Placeholdit.image(size: '50x50'), material: Faker::Commerce.material, price: Faker::Commerce.price(range: 1..750), sku: Faker::Number.number(digits: 10), weight: Faker::Measurement.weight})
    @item.inventory = inventory
    @item
  end

end

