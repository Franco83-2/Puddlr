module LoginHelper
  def visit_signup
    visit '/'
    click_link('Sign up')
  end

  def user_signup
    fill_in("user[email]", :with => "johncandy@mars.com")
    fill_in("user[password]", :with => "password")
    fill_in("user[password_confirmation]", :with => "password")
    # fill_in("user[location]", :with => "Boomtown")
    click_button('Create User')
  end

  def create_profile
    fill_in("profile[name]", :with => "john candy")
    fill_in("profile[address]", :with => "123 grove street")
    fill_in("profile[phone]", :with => "1234567890")
    click_button('Create Profile')
  end

  def visit_signin
    visit '/'
    click_link('Sign in')
  end

  def user_login
    mindy = User.create(
      email: "Mindy@mindyproject.com",
      password: "password",
      location_id: 1
    )
    Profile.create(
    :name => "Mandy",
    :address => "123 Mean muggin way",
    :phone => 1234567689,
    :user_id => mindy.id
    )
    fill_in("user[email]", :with => "Mindy@mindyproject.com")
    fill_in("user[password]", :with => "password")
    # fill_in("user[location]", :with => "Boomtown")
    click_button('Sign In')
  end

end
