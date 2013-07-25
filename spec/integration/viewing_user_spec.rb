require 'spec_helper'
feature 'Viewing user profile' do
#need to add factory girl gem and factory for user
  before do
    Factory(:user, :email => "codefellow@example.com")
  end

  scenario 'Viewing user profile via signing in' do
    User.find_by_email('codefellow@example.com')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "codefellow@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("codefellow@example.com")
    page.current_url.should == user_url(user)
  end

end
