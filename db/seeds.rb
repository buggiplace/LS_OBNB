# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting seed"

puts "Adding one office"

Office.create!(name: "Omniturm", description: "Amazing place", address: "Berlin", price: 50, availability_description: "Open during Q1", table_num: "many", wifi: true, amenities: true, user_id: 1 )

puts "Seed done"
