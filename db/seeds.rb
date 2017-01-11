# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(name: "Boom Bank")
Company.create(name: "Flatiron School")
Location.create(address: "123 Boom St", name:"BoomyVille Location", company_id: Company.first.id)
Location.create(address: "345 Boom St", name:"BoomTown Location", company_id: Company.first.id)
Location.create(address: "Flatiron District", name:"Flatiron Location", company_id: Company.second.id)
Location.create(address: "11 Broadway", name:"Financial District Location", company_id: Company.second.id)
User.create(email: "franco@franco.franco", password: "franco", admin: true, company_id: Company.first.id)
User.create(email: "joe@joe.joe", password: "joe", admin: true, company_id: Company.second.id)
User.create(email: "yomi@yomi.yomi", password: "yomi", admin: true, company_id: Company.first.id)
Car.create(make: "Ferrari", model: "Boom", year:2099, color: "Ridiculous", user_id: User.first.id)
Profile.create(name: "Franco", address: "234 Boom St", phone:"2125550123", location: 1, user_id: User.first.id)
Profile.create(name: "Joe", address: "235 Boom St", phone:"2125550124", location: 2, user_id: User.second.id)
Profile.create(name: "Yomi", address: "235 Boom St", phone:"2125550124", location: 2, user_id: User.third.id)
Driver.create(user_id: User.first.id)
Passenger.create(user_id: User.second.id)
Puddle.create(driver_id: Driver.first.id, seats: 4, departure_time: (DateTime.now + 5))
PuddlePassenger.create(passenger_id: Passenger.first.id, puddle_id: Puddle.first.id)
