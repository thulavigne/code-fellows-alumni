require 'spec_helper'
feature 'Signing out' do

  before do
    Factory(:user, :email => "codefellow@example.com")
  end

  scenario 'Signing out by link' do
    User.find_by_email('codefellow@example.com')
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    #fill_in 'Password', :with => "password"
    click_button "Sign in"
    #click_link "Sign out"
    #page.current_path.should == root_path
  end

end
