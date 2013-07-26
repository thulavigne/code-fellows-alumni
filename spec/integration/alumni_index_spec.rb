require 'spec_helper'
feature 'Alumni index' do

  before do
    Factory(:user, :email => "codefellow@example.com")
  end

  scenario 'Alumni index page' do
    visit '/'
    click_link 'Sign up'
    fill_in "Email", :with => "user@codefellow.com"
    fill_in "Password", :with => "password"
    fill_in "Password confirmation", :with => "password"
    click_button "Sign up"
    click_link "Home"
    page.current_path.should == users_path
    page.should have_content("user@codefellow.com")
  end

end
