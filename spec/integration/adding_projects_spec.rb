require 'spec_helper'

feature 'Adding Projects' do

  before do
    Factory(:user, :email => "codefellow@example.com")
    User.find_by_email('codefellow@example.com')
    visit '/'
    click_link 'Sign in'
    click_link 'Add Project'
  end

  scenario "can create a project" do
    fill_in 'Name', :with => 'TextMate 2'
    fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Project'
    page.should have_content('Project has been created')

    project = Project.find_by_name("TextMate 2")
    page.current_path.should == user_project_path(project)
    title = "TextMate 2"
    find("title").should have_content(title)
  end

end
