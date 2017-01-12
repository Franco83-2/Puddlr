require_relative "../rails_helper.rb"
require 'pry'

describe 'Feature Test: User Signup', :type => :feature do

  it 'successfully signs up' do
    visit_signup
    expect(current_path).to eq('/users/new')
    user_signup
    expect(current_path).to eq('/profiles/new')
    create_profile
    expect(current_path).to eq('/profiles/1')
  end

  it "on sign up, successfully adds a session hash" do
    visit_signup
    user_signup
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'successfully logs in' do
    visit_signin
    expect(current_path).to eq('/signin')
    user_login
    expect(current_path).to eq('/users/3')
  end

  # it "on log in, successfully adds a session hash" do
  #   visit_signin
  #   user_login
  #   expect(page.get_rack_session_key('user_id')).to_not be_nil
  # end

  it 'prevents user from viewing user show page and redirects to home page if not logged in' do
    @mindy = User.create(
      email: "Mindy@mindyproject.com",
      password: "password",
    )
    visit '/users/1'
    expect(current_path).to eq('/')
    expect(page).to have_content("Sign up")
  end

  # it 'successfully signs up as admin' do
  #   visit_signup
  #   expect(current_path).to eq('/users/new')
  #   admin_signup
  #   expect(current_path).to eq('/users/1')
  #   expect(page).to have_content("Walt Disney")
  #   expect(page).to have_content("ADMIN")
  # end

  # it "on sign up for admin, successfully adds a session hash" do
  #   visit_signup
  #   admin_signup
  #   expect(page.get_rack_session_key('user_id')).to_not be_nil
  # end

  # it 'successfully logs in as admin' do
  #   visit_signin
  #   expect(current_path).to eq('/signin')
  #   admin_login
  #   expect(current_path).to eq('/users/2')
  #   expect(page).to have_content("Walt Disney")
  #   expect(page).to have_content("ADMIN")
  # end

  # it "on log in, successfully adds a session hash to admins" do
  #   visit_signin
  #   admin_login
  #   expect(page.get_rack_session_key('user_id')).to_not be_nil
  # end

end

describe 'Feature Test: User Signout', :type => :feature do

  it 'has a link to log out from the users/show page' do
    visit_signup
    user_signup
    expect(page).to have_content("Log Out")
  end

  it 'redirects to home page after logging out' do
    visit_signup
    user_signup
    click_link("Log Out")
    expect(current_path).to eq('/')
  end

  it "successfully destroys session hash when 'Log Out' is clicked" do
    visit_signup
    user_signup
    click_link("Log Out")
    expect(page.get_rack_session).to_not include("user_id")
  end

  # it 'has a link to log out from the users/show page when user is an admin' do
  #   visit_signup
  #   admin_signup
  #   expect(page).to have_content("Log Out")
  # end

  # it 'redirects to home page after admin logs out when user is an admin' do
  #   visit_signup
  #   admin_signup
  #   click_link("Log Out")
  #   expect(current_path).to eq('/')
  # end

  # it "successfully destroys session hash when 'Log Out' is clicked as admin" do
  #   visit_signup
  #   admin_signup
  #   click_link("Log Out")
  #   expect(page.get_rack_session).to_not include("user_id")
  # end
end

  describe 'Feature Test: Puddles', :type => :feature do

  before :each do
  puddle = Puddle.create(
    :departure_time => DateTime.now,
    :seats => 6,
    :distance => 2.5,
    :driver_id => driver.id
    )
    visit_signup
    user_signup
  end

  it 'has a link from the user show page to the puddle index page' do
    expect(current_path).to eq('/puddles/1')
    expect(page).to have_content("View Open Puddles")
    click_link('s')
  end

  it 'prevents users from editing/deleting/adding pudddles on the index page' do
    click_link('View Open Puddles')
    expect(current_path).to eq('/puddles')
    expect(page).to_not have_content("edit")
    expect(page).to_not have_content("delete")
    expect(page).to have("")
  end

  it 'has number of the seats in the puddle index page' do
    click_link('See puddles')
    expect(page).to have_content("#{puddle.seats}")
  end

  it "links from the puddle index page to the puddles' show pages" do
    click_link('See puddles')
    click_link("Go on #{puddle.name}")
    expect(current_path).to eq("/puddles/2")
  end
end
