require 'spec_helper'
feature 'Viewing user profile' do

  let(:user) {Factory(:user, :email => "ginger@example.com")}

  before do
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    click_button "Sign in"
    Factory(:user, :email => "george@example.com")
  end

  scenario 'Viewing user profile' do
    visit(user_path(user))
    #page.should have_content("")
    page.should_not have_content("george@example.com")
  end

end
