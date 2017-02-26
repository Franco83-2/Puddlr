class SessionsController < ApplicationController
  skip_before_action :authorize_user, only: [:new,:demo, :create]

  def new
    @user = User.new
  end

  def demo
    @user = User.create(password: "password", password_confirmation: "password", email: "mail#{rand(1..10)}#{rand(1..10)}#{rand(1..10)}#{rand(1..10)}@mail#{rand(1..10)}#{rand(1..10)}.com", company_id: rand(1..10))
    Profile.create(name: "Demo Demerson", address: "#{Faker::Address.street_address}, #{Faker::Address.city}", phone: "#{Faker::PhoneNumber.subscriber_number(10)}", user_id: @user.id)
    Driver.create(user_id: @user.id)
    Passenger.create(user_id: @user.id)
    Car.create(user_id: @user.id, make: "Lexus", model: "ES350", year: 2015, color: "Red")
    5.times do |i|
      Puddle.create(driver_id: @user.id, seats: 4, distance: 5, departure_time: (DateTime.now + rand(2..30)))
    end

    puddles = Puddle.where(driver_id: @user.id)

    5.times do |i|
      ride = PuddlePassenger.create(passenger_id: rand(1..40), puddle_id: puddles[i].id)
      puddle = Puddle.find(ride.puddle_id)
      puddle.update(seats: puddle.seats -= 1)
    end
    5.times do |i|
      ride = PuddlePassenger.create(passenger_id: rand(1..40), puddle_id: puddles[i].id)
      puddle = Puddle.find(ride.puddle_id)
      puddle.update(seats: puddle.seats -= 1)
    end
    5.times do |i|
      ride = PuddlePassenger.create(passenger_id: rand(1..40), puddle_id: puddles[i].id)
      puddle = Puddle.find(ride.puddle_id)
      puddle.update(seats: puddle.seats -= 1)
    end

    20.times do |i|
      ride = PuddlePassenger.create(passenger_id: @user.id, puddle_id: rand(1..100))
      puddle = Puddle.find(ride.puddle_id)
      puddle.update(seats: puddle.seats -= 1)
    end
    session[:user_id] = @user.id
    redirect_to @user
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:message] = "Incorrect Username or Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
