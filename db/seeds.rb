# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Puddle.create(driver_id: Driver.first.id, seats: 4, departure_time: (DateTime.now + 5))
# Puddle.create(driver_id: Driver.first.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.first.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now + 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now + 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now + 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now - 5))
# Puddle.create(driver_id: Driver.second.id, seats: 4, departure_time: (DateTime.now - 5))
# PuddlePassenger.create(passenger_id: Passenger.first.id, puddle_id: Puddle.first.id)
# PuddlePassenger.create(passenger_id: Passenger.second.id, puddle_id: Puddle.first.id)
20.times do
  Company.create(name: Faker::Company.name)
end

20.times do
  User.create(password: "password", password_confirmation: "password", email: Faker::Internet.email, company_id: rand(1..10))
end

20.times do |i|
  Profile.create(name: Faker::Name.name, address: "#{Faker::Address.street_address}, #{Faker::Address.city}", phone: "#{Faker::PhoneNumber.subscriber_number(10)}", user_id: i+1)
end

20.times do |i|
  Location.create(address: "#{Faker::Address.street_address}", name: "#{Faker::Address.city}", company_id: i+1)
  Location.create(address: "#{Faker::Address.street_address}", name: "#{Faker::Address.city}", company_id: i+1)
  Location.create(address: "#{Faker::Address.street_address}", name: "#{Faker::Address.city}", company_id: i+1)
end

20.times do |i|
  Driver.create(user_id: i+1)
end

20.times do |i|
  Passenger.create(user_id: i+1)
end

100.times do |i|
  Puddle.create(driver_id: rand(1..10), seats: 5, departure_time: (DateTime.now + rand(2..5)))
end

100.times do |i|
  PuddlePassenger.create(passenger_id: rand(1..10), puddle_id: rand(1..100))
end
