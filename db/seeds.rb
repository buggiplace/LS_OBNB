# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting seed"


#comment the following line out in case of activating the loop below
# Office.create!(name: "Omniturm", description: "Amazing place", address: "Berlin", price: 50, availability_description: "Open during Q1", table_num: "many", wifi: true, amenities: true, user_id: 1 )

# add user id in case of activating !!!

puts "Adding 20 users"

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
  )
end

puts "User Seed done"

puts "Adding 20 offices"
20.times do
  Office.create!(
    name: Faker::Restaurant.name,
    description: "placehold_description",
    address: Faker::Address.full_address,
    price: Faker::Number.within(range: 1..10),
    wifi: Faker::Boolean,
    availability_description: "placehold_availabilty_description",
    table_num: "placehold_table_num",
    amenities: Faker::Boolean,
    user_id: Faker::Number.within(range: 1..5),
  )
end
puts "Office Seed done"






puts "Seed finished"
