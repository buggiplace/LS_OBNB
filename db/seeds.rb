puts "Starting seed"

puts "Cleaning old seeds"

Booking.destroy_all
Office.destroy_all
User.destroy_all

puts "Adding users"

20.times do
  User.create!(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

puts "User Seed done - #{User.count} added"

puts "Adding offices"

require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = Rails.root.join('db', 'address_seed4.csv')

    CSV.foreach(filepath, csv_options) do |row|

      Office.create!(
          office_name: Faker::Company.name,
          description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
          rate_per_day: Faker::Number.within(range: 1..200),
          address_street: row['address_street'],
          address_zip: row['address_zip'],
          address_city: row['address_city'],
          placehold_url: row['picture_link'],
          user_id: User.all.sample.id,
          table_num: Faker::Number.within(range: 1..20),
          wifi: Faker::Boolean.boolean,
          drinks: Faker::Boolean.boolean,
          snacks: Faker::Boolean.boolean,
          social_events: Faker::Boolean.boolean,
          community_slack: Faker::Boolean.boolean,
          pets_allowed: Faker::Boolean.boolean,
          night_shift: Faker::Boolean.boolean,
          community_manager: Faker::Boolean.boolean,
          outdoor_area: Faker::Boolean.boolean,
          smoking_area: Faker::Boolean.boolean,
          cat_open_space: Faker::Boolean.boolean,
          cat_single_space: Faker::Boolean.boolean,
          cat_corporate: Faker::Boolean.boolean,
          cat_startup: Faker::Boolean.boolean,
          cat_private_owner: Faker::Boolean.boolean,
          cat_skyscraper: Faker::Boolean.boolean,
          cat_city: Faker::Boolean.boolean,
          cat_rural: Faker::Boolean.boolean,
          cat_boutique: Faker::Boolean.boolean,
          cat_black_lable: Faker::Boolean.boolean
        )

  end

puts "Office Seed done - #{Office.count} added"

puts "Adding bookings"

200.times do
  Booking.create!(
    user_id: User.all.sample.id,
    office_id: Office.all.sample.id,
    booking_start: Date.today + rand(1..100),
    booking_end: Date.today + 100 + rand(1..300)
  )
end

puts "Booking Seed done - #{Booking.count} bookings created"



puts "Seed finished"
