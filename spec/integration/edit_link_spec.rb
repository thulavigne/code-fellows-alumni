require 'spec_helper'
feature 'Edit link' do

  before do
    Factory(:user, :email => "codefellow@example.com")
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    # fill_in 'Password', :with => "password"
    click_button "Sign in"
  end

  scenario 'Edit link on user profile' do
    #click_link "Add link"
    #fill_in 'Full URL with http/https', :with => "https://github.com/ggriffis"
    #fill_in 'Description', :with => "My github account"
    #page.select 'Code Repository', :from => 'link_url_type'
    #click_button "Create Link"
    #find(:xpath, "//tr[contains(.,'My github account')]/td/a",
    #  :text => 'Edit').click
    #fill_in 'Full URL with http/https', :with => "http://www.linkedin.com/profile/view?id=26748246&trk=nav_responsive_tab_profile_pic"
    #fill_in 'Description', :with => "My linked in account"
    #page.select 'Professional Networking', :from => 'link_url_type'
    #click_button "Update Link"
    #user = User.find_by_email('codefellow@example.com')
    #page.should have_content("My linked in account")
    #page.should_not have_content("My github account")
    #page.current_path.should == user_path(user)
  end

  scenario 'Edit link on project' do
    #click_link "Add project"
    #fill_in 'Title', :with => 'Codefellows project'
    #fill_in 'Description', :with => "A way for codefellow alumni to get jobs"
    #click_button 'Create Project'
    #find(:xpath, "//tr[contains(.,'Codefellows project')]/td/a",
    #  :text => 'Codefellows project').click
    #click_link "Add link"
    #fill_in 'Full URL with http/https', :with => "https://github.com/ggriffis"
    #fill_in 'Description', :with => "My github account"
    #page.select 'Code Repository', :from => 'link_url_type'
    #click_button "Create Link"
    #find(:xpath, "//tr[contains(.,'My github account')]/td/a",
    #  :text => 'Edit').click
    #fill_in 'Full URL with http/https', :with => "http://www.linkedin.com/profile/view?id=26748246&trk=nav_responsive_tab_profile_pic"
    #fill_in 'Description', :with => "My linked in account"
    #page.select 'Professional Networking', :from => 'link_url_type'
    #click_button "Update Link"
    #project = Project.find_by_title('Codefellows project')
    #page.should have_content("My linked in account")
    #page.should_not have_content("My github account")
    #page.current_path.should == project_path(project)
  end

end
