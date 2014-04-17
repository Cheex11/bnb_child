require 'spec_helper'

feature "Creating a new user - devise gem used" do
  scenario 'it allows an individual to create a new user from any page via the nav bar as long as another user is not signed in' do
    visit root_path
    click_on "Sign Up"
    fill_in 'Username', :with => "name"
    fill_in "Email", :with => "name@email.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_on "Sign up"
    page.should have_content "Welcome"
  end
end

feature "Creating a new Listing" do
  scenario 'It allows a signed in user to go to access the new listing form'do
    create_and_sign_in
    visit user_path(@user)
    click_on "Add a new listing"
    page.should have_content "Add Listing"
  end
  scenario "It allows a signed in user to create a new listing from the listing/new page" do
    create_and_sign_in
    visit new_listing_path
    listing = FactoryGirl.create(:listing)
    fill_in "Title", :with => "title"
    click_on "Create Listing"
    page.should have_content "Listing Added"
  end
end

