require 'rails_helper'

RSpec.describe Passenger, :type => :model do
  let(:passenger){
    Passenger.create(
    :user_id => user.id
    )
  }

  let(:user) {
    User.create(
      :email => "Mindy@mindyproject.com",
      :password => "password",
      :location_id => location.id
    )}

    let(:profile){
      Profile.create(
      :name => "Mandy",
      :address => "123 Mean muggin way",
      :phone => 1234567689,
      :user_id => user.id
      )
    }
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

context 'validation' do
  it "is valid with a user_id" do
    expect(passenger).to be_valid
  end

  end
end
