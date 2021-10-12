class Seed < ApplicationRecord
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
    @user = User.create({ first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.unique.email , address: Faker::Address.full_address, phone: Faker::PhoneNumber.cell_phone, password: 'test', balance: 'NA/BOT'})
  end

  def self.create_store_sc(user)
    @store = user.create_store({ name: Faker::Company.name, email: Faker::Internet.unique.email, address: Faker::Address.full_address, store_description: Faker::Company.catch_phrase, logo: Faker::Company.logo})
  end

  def self.create_inventory_sc(store)
    @inventory = store.create_inventory({description: Faker::Quotes::Shakespeare.as_you_like_it_quote})
  end

  def self.create_item_sc(inventory)
    item = Item.new({sku: Faker::Number.number(digits: 10), title: Faker::Commerce.unique.product_name, description: Faker::Hipster.unique.paragraph(sentence_count: 6), price: Faker::Commerce.price(range: 1..750), picture: Faker::Placeholdit.image(size: '50x50'), color: Faker::Commerce.color, material: Faker::Commerce.material, size: Faker::Measurement.weight, pieces: Faker::Number.between(from: 1, to: 10), manufacturer: Faker::Commerce.brand, country_of_origin: Faker::Address.country})
    item.inventory == inventory
    item
  end

end

end
