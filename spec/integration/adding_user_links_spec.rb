require 'spec_helper'
feature 'Adding a user link to a user profile' do

  before do
    Factory(:user, :email => "codefellow@example.com", :first_name => "Ginger",
                              :last_name => "Griffis")
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    click_link "Add link"
  end

  scenario 'Add a link to a user' do
    fill_in 'Full URL with http/https', :with => "https://github.com/ggriffis"
    fill_in 'Description', :with => "My github account"
    page.select 'Code Repository', :from => 'link_url_type'
    click_button "Create Link"
    user = User.find_by_email('codefellow@example.com')
    page.should have_content("Link has been added")
    page.should have_content("My github account")
    page.current_url.should == user_url(user)
  end

end
