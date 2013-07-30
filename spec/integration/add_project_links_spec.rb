require 'spec_helper'
feature 'Adding a link to a project' do

  before do
    Factory(:user, :email => "codefellow@example.com",
                              :first_name => "Ginger",
                              :last_name => "Griffis")
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "codefellow@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description', :with => "this project does some really interesting things"
    click_button "Create Project"
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    click_link "Add link"
  end

  scenario 'Add a link to a project' do
    fill_in 'Url', :with => "https://github.com/ggriffis/some-project.git"
    fill_in 'Description', :with => "My project github account"
    page.select 'Code Repository', :from => 'link_url_type'
    click_button "Create Link"
    project = Project.find_by_title("interesting project")
    page.should have_content("Link has been added")
    page.should have_content("My project github account")
    page.current_path.should == project_path(project)
  end

end
