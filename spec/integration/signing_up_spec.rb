require 'spec_helper'

feature 'Signing up' do
  scenario 'Successful sign up' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Username', :with => "username"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    user = User.find_by_email('user@codefellow.com')
    page.current_path.should == user_path(user)
    page.should have_content('You have signed up successfully.')
  end
end
