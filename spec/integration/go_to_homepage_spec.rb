require 'spec_helper'
feature 'Go to homepage' do

  before do
    Factory(:user, :email => "codefellow@example.com")
  end

  scenario 'Go to homepage as visitor' do
    visit '/'
    page.current_path.should == root_path
  end

  scenario 'Go to homepage as signed in user' do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "codefellow@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    click_link "Home"
    page.current_path.should == "/en"
  end

end
