require 'spec_helper'
feature 'Add address to a user' do

  let!(:user) { Factory(:user, :email => "codefellow@whatever.com",
                            :first_name => "Ginger",
                            :last_name => "Griffis") }

  before do
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
  end

  scenario 'Add address to a user' do
    click_link "Add address"
    fill_in 'Street address', :with => "1234 Lucky Lane"
    fill_in 'City', :with => "Prague"
    page.select 'Czech Republic', :from => 'Country'
    click_button "Create Address"
    page.should have_content("Address has been created")
    page.should have_content("Czech Republic")
    page.current_path.should == user_path(user)
  end

end
