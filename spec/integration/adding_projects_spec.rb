require 'spec_helper'

feature 'Adding Projects' do

  before do
    Factory(:user, :email => "codefellow@example.com")
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    # fill_in 'Password', :with => "password"
    click_button "Sign in"
    #click_link 'Add project'
  end

  scenario "can create a project" do
    #fill_in 'Title', :with => 'Codefellows project'
    #fill_in 'Description', :with => "A way for codefellow alumni to get jobs"
    #click_button 'Create Project'
    #page.should have_content('Project has been created')

    #user = User.find_by_email("codefellow@example.com")
    #project = Project.find_by_title("Codefellows project")
    #page.current_path.should == user_path(user)
    #page.should have_content('Codefellows project')
  end

end
