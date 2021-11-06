# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{name: 'All'},{name: 'Automotive & Powersports'},{name: 'Baby Products'},{name: 'Beauty'}, {name: 'Camera & Photo'}, {name: 'Cell Phones & Accessories'}, {name: 'Collectibles'}, {name: 'Electronics'}, {name: 'Fine Art'}, {name: 'Grocery & Gourmet Food'}, {name: 'Health & Personal Care'}, {name: 'Home & Garden'}, {name: 'Industrial & Scientific'}, {name: 'Appliances'}, {name: 'Musical Instruments'}, {name: 'Office Products'}, {name: 'Outdoors'}, {name: 'Computers, Parts & Accessories'}, {name: 'Pet Supplies'}, {name: 'Software'}, {name: 'Sports Equipment'}, {name: 'Tools & Home Improvement'}, {name: 'Toys & Games'}, {name: 'Video, DVD & Blu-Ray'}, {name: 'Video Games'}, {name: 'Clothing'}, {name: 'Watches'}, {name: 'Shoes'}])


statuses = Status.create!([{name: 'Pending'},{name: 'Confirmed'},{name: 'Awaiting Shipment'},{name: 'Shipped'},{name: 'Delivered'},{name: 'Return Requested'},{name: 'Return Approved'},{name: 'Return Shipped'},{name: 'Return Arrived'},{name: 'Refunding'},{name: 'Refunded'}])

users = User.create!([{full_name: 'James Tillman', email: 'test@test.com', phone: '303-396-7135', password: 'default' slime: true},{full_name: 'Neil Tillman', email: 'neil@test.com', phone: '720-396-7135', password: 'default' slime: false}])

stores = Store.create!([{name: 'Teds Truck n Tire', email: 'rubbermeetsroad@test.com', description: 'Where you can get the tires you want, for the price thats right. Trust us, were not even out to make money*', logo: 'test', industry:'Automotive',mission_statement: 'Were not even out to make money*', ein: '71-4560912', user_id: users.first.id}, {name: 'Neils Golf Shorp', email: 'golfnshorp@test.com', description: 'Large wholesale golf store focused on making you swing better', logo: 'test', industry:'Sports Supply',mission_statement: 'Ever knocked it into the 310s, you wont be saying that tomorrow', ein: '70-4560000', user_id: users.last.id}])

inventory = Inventory.create!([{store_id: stores.first.id},{store_id: stores.last.id}])