# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{name: 'All'},{name: 'Automotive & Powersports'},{name: 'Baby Products'},{name: 'Beauty'}, {name: 'Camera & Photo'}, {name: 'Cell Phones & Accessories'}, {name: 'Collectibles'}, {name: 'Electronics'}, {name: 'Fine Art'}, {name: 'Grocery & Gourmet Food'}, {name: 'Health & Personal Care'}, {name: 'Home & Garden'}, {name: 'Industrial & Scientific'}, {name: 'Appliances'}, {name: 'Musical Instruments'}, {name: 'Office Products'}, {name: 'Outdoors'}, {name: 'Computers, Parts & Accessories'}, {name: 'Pet Supplies'}, {name: 'Software'}, {name: 'Sports Equipment'}, {name: 'Tools & Home Improvement'}, {name: 'Toys & Games'}, {name: 'Video, DVD & Blu-Ray'}, {name: 'Video Games'}, {name: 'Clothing'}, {name: 'Watches'}, {name: 'Shoes'}])


statuses = Status.create!([{name: 'Pending'},{name: 'Confirmed'},{name: 'Awaiting Shipment'},{name: 'Shipped'},{name: 'Delivered'},{name: 'Return Requested'},{name: 'Return Approved'},{name: 'Return Shipped'},{name: 'Return Arrived'},{name: 'Refunding'},{name: 'Refunded'}])