require 'spec_helper'
feature 'Editing user profile' do

  before do
    Factory(:user, :email => "codefellow@example.com")
    User.find_by_email('codefellow@example.com')
    visit '/'
    click_link 'Sign in'
    click_link "Edit Profile"
  end

  scenario 'Editing user profile' do
    fill_in 'First name', :with => "Thu"
    fill_in 'Last name', :with => "Quach"
    click_button "Update profile"
    page.should have_content("Profile has been updated.")
    page.should have_content("Thu")
    page.current_url.should == user_url(user)
  end

end
