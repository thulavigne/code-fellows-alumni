require 'spec_helper'
feature 'Valid access when signed in' do

  let!(:user) {Factory(:user, :email => "codefellow@example.com",
            :first_name => "John")}

  before do
    visit '/'
    click_link 'Sign in'
    fill_in 'Username', :with => "username"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    click_link "Add link"
    fill_in 'Full URL with http/https', :with => "https://github.com/ggriffis"
    fill_in 'Description', :with => "My github account"
    page.select 'Code Repository', :from => 'link_url_type'
    click_button "Create Link"
    click_link "Sign out"
    visit(user_path(user))
  end

  scenario 'Cannot edit a profile' do
    page.should_not have_content("Edit Profile")
  end

  scenario 'Cannot add a project to a profile' do
    page.should_not have_content("Add project")
  end

  scenario 'Cannot add a link to my profile' do
    page.should_not have_content("Add link")
  end

  scenario 'Cannot add a link to a project' do
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_content("Add link")
  end

  scenario 'Cannot delete a link from a project' do
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_content("Delete") #should refactor to look for just link edit
  end

  scenario 'Cannot edit a project on a profile' do
    page.should_not have_link("Edit") #need to refactor to look just for project edit
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_link("Edit")
  end

  scenario 'Cannot delete a project from a profile' do
    page.should_not have_link("Delete") #need to refactor to look just for project edit
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_link("Delete")
  end

end
