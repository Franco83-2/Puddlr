require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.new(
      :email => "Mindy@mindyproject.com",
      :password => "password",
      :location_id => location.id
    )}
    let(:user_2) {
      User.new(
        :email => "Mandy@mandyproject.com",
        :password => "password1",
        :location_id => location.id
      )}

      let(:profile) {
        Profile.new(
          :user_id => user.id
        )}

      let(:profile_2) {
        Profile.new(
          :user_id => user_2.id
        )}

    let(:location) {
      Location.create(
       :name => "Mars West Village",
       :address => "123 Mars Avenue",
       :company_id => company.id
    )}

    let(:company) {
      Company.create(
       :name => "Mars Inc",
    )}

    let(:car){
      Car.create(
      :make => "Jalapeno",
      :model => "Hot Sauce",
      :year => 2017,
      :color => "Mustard Yellow",
      :user_id => user.id,
      )
    }

    let(:car_2){
      Car.create(
      :make => "Habanero",
      :model => "Chilli",
      :year => 1992,
      :color => "Racing Green",
      :user_id => user_2.id,
      )
    }

    let (:driver){
      Driver.create(
      :user_id => user.id
      )
    }

    let (:passenger){
      Passenger.create(
      :user_id => user_2.id
      )
    }

    let(:puddle){
      Puddle.create(
      :departure_time => 1230,
      :seats => 6,
      :distance => 2.5,
      :driver_id => driver.id
      )
    }

context 'validation' do
    it "is valid with a email, password, and location_id" do
    expect(user).to be_valid
    end

    it "is not valid without a password" do
    expect(User.new(email: "Name")).not_to be_valid
    end

    it "is not valid without a location_id" do
    expect(User.new(email: "Name", password: "pewpew")).not_to be_valid
    end

    it "has many profiles" do
      expect(user.profiles).to eq([])
    end

    it "has many drivers" do
    expect(user.drivers).to eq([])
    end

    it "has many passengers" do
      expect(user.passengers).to eq([])
    end

    it "has many puddles" do
      expect(user.puddles).to eq([])
    end

  end
end
