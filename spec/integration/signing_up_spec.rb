require 'spec_helper'
#add factory girl gem and factory for user
feature 'Signing up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", :with => "user@codefellow.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    page.current_url.should == user_url(user)
  end
end
