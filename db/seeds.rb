# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(name: "Boomtown Corp")
Location.create(address: "123 Boom St", name:"Boomyville Location", company_id: Company.first.id)
User.create(email: "boom@boom.com", password: "boom", admin: true, location_id: Location.first.id)
User.create(email: "boomy@boomy.com", password: "boomy", admin: true, location_id: Location.first.id)
Car.create(make: "Ferrari", model: "Boom", year:2099, color: "Ridiculous", user_id: User.first.id)
Profile.create(name: "Boomy McBoom", address: "234 Boom St", phone:2125550123, user_id: User.first.id)
Profile.create(name: "Boomy McBoomerson", address: "235 Boom St", phone:2125550124, user_id: User.second.id)
Driver.create(user_id: User.first.id)
Passenger.create(user_id: User.second.id)
Puddle.create(driver_id: Driver.first.id)
PuddlePassenger.create(passenger_id: Passenger.first.id, puddle_id: Puddle.first.id)
