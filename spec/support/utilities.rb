require 'spec_helper'

def create_and_sign_in
  @user = FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in 'Username', :with => @user.username
  fill_in "Password", :with => @user.password
  click_on "Sign in"
end
