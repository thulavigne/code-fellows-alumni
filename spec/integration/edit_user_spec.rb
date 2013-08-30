require 'spec_helper'
feature 'Editing user profile' do

  before do
    Factory(:user, :email => "codefellow@example.com",
                              :first_name => "Ginger",
                              :last_name => "Griffis")
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    # fill_in 'Password', :with => "password"
    click_button "Sign in"
    #click_link "Edit Profile"
  end

  scenario 'Editing user profile' do
    #fill_in 'First name', :with => "Thu"
    #fill_in 'Last name', :with => "Quach"
    #click_button "Update profile"
    #user = User.find_by_email('codefellow@example.com')
    #page.should have_content("Profile has been updated.")
    #page.should_not have_content("Ginger")
    #page.current_url.should == user_url(user)
  end

end
