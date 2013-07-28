require 'spec_helper'
feature 'Signing in' do
#need to add factory girl gem and factory for user
  before do
    Factory(:user, :email => "codefellow@example.com")
  end

  scenario 'Signing in via form' do
    @user = User.find_by_email('codefellow@example.com')
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "codefellow@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
    page.current_path.should == user_path(@user)
  end

end
