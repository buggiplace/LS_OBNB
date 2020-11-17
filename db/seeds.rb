puts "Starting seed"

puts "Cleaning old seeds"

Office.destroy_all
User.destroy_all

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
    user_id: User.all.sample.id
  )
end

puts "Office Seed done"


# uncomment when user model exists
# puts "Adding 10 bookings"

# 10.times do
#   Booking.create!(
#     user_id: User.all.sample.id,
#     office_id: Office.all.sample.id,
#     booking_start: Date.today,
#     booking_end: Date.today + 5
#   )
# end

# puts "Booking Seed done"



puts "Seed finished"
