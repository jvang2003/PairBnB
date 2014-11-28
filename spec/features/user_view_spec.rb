require 'rails_helper'

feature "user sessions" do
  before do
    User.create!(name: "test person", email: "test@gmail.com", password: "testing123" )
  end
  scenario "when user logs in" do
    visit '/'
    #will need to add something here to tell it to click Login once we test further
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => "testing123"
    click_button 'Login'
    expect(page).to have_text('Logout')
  end

  scenario "when user clicks sign up" do
    visit '/'
    click_on 'Sign Up'
    expect(page).to have_text('Sign Up')
  end

  scenario "when user signs up with valid info" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Name', :with => "Cats McGee"
    fill_in 'Email', :with => "cats@gmail.com"
    fill_in 'Password', :with => "catscatscats"
    click_on 'Sign Up'
    expect(page).to have_text('Logout')
  end
end
