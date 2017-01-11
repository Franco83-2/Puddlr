require 'rails_helper'

RSpec.describe Profile, :type => :model do
  let(:profile){
    Profile.create(
    :name => "Mandy",
    :address => "123 Mean muggin way",
    :phone => 1234567689,
    :user_id => user.id
    )
  }

  let(:user) {
    User.create(
      :email => "Mindy@mindyproject.com",
      :password => "password",
      :location_id => location.id
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

context 'validation' do
  it "is valid with a user_id" do
    expect(profile).to be_valid
  end

  it "is has a field for name" do
    expect(profile.name).to eq("Mandy")
  end

  it "is has a field for address" do
    expect(profile.address).to eq("123 Mean muggin way")
  end

  it "is has a field for phone number" do
    expect(profile.phone).to eq("1234567689")
  end

  end
end
