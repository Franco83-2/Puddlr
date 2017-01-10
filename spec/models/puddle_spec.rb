require 'rails_helper'

RSpec.describe Puddle, :type => :model do
  let(:puddle){
    Puddle.create(
    :departure_time => DateTime.now,
    :seats => 6,
    :distance => 2.5,
    :driver_id => driver.id
    )
  }

  let(:user) {
    User.create(
      :email => "Mindy@mindyproject.com",
      :password => "password",
      :location_id => location.id
    )}

    let(:user_2) {
      User.create(
        :email => "Mandy@mandyproject.com",
        :password => "password1",
        :location_id => location.id
      )}

    let(:profile) {
      Profile.create(
        :user_id => user.id
      )}

      let(:profile_2) {
        Profile.create(
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
context 'validation' do
  it "is valid with a driver_id" do
    expect(puddle).to be_valid
  end

  it "is has a field for seats" do
    expect(puddle.seats).to eq(6)
  end

  it "is has a field for departure time" do
    expect(puddle.departure_time).to eq(DateTime.now)
  end

  it "is has a field for distance" do
    expect(puddle.distance).to eq(2.5)
  end

  it "belongs to one driver" do
    expect(puddle.driver).to eq(driver)
  end

  it "has a method 'passenger_list' that list passsengers" do
    expect(puddle.passenger_list).to eq([])
  end

  it "has a method 'driver_info' that returns an array with the drivers information" do
    expect(puddle.driver_info).to eq([])
  end


  end
end
