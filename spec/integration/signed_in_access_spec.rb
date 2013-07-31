require 'spec_helper'
feature 'Valid access when signed in' do

  before do
    Factory(:user, :email => "someotheruser@example.com",
            :first_name => "John")
    Factory(:user, :email => "codefellow@example.com")
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "codefellow@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
  end

  scenario 'Can edit my profile' do
    page.should have_content("Edit Profile")
  end

  scenario 'Can add a project to my profile' do
    page.should have_content("Add project")
  end

  scenario 'Can add a link to my profile' do
    page.should have_content("Add link")
  end

  scenario 'Can add a link to my project' do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should have_content("Add link")
  end

  scenario 'Can delete a link from my project' do
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
    page.should have_content("Delete") #should refactor to look for just link edit
  end

  scenario 'Can edit a project on my profile' do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    page.should have_link("Edit") #need to refactor to look just for project edit
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should have_link("Edit")
  end

  scenario 'Can delete a project from my profile' do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    page.should have_link("Delete") #need to refactor to look just for project edit
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should have_link("Delete")
  end

  scenario "Cannot edit someone else's profile" do
    user = User.find_by_email("someotheruser@example.com")
    visit(user_path(user))
    page.should_not have_content("Edit Profile")
  end

  scenario "Cannot add a project to someone else's profile" do
    user = User.find_by_email("someotheruser@example.com")
    visit(user_path(user))
    page.should_not have_content("Add project")
  end

  scenario "Cannot add a link to someone else's profile" do
    user = User.find_by_email("someotheruser@example.com")
    visit(user_path(user))
    page.should_not have_content("Add link")
  end

  scenario "Cannot delete a link from someone else's profile" do
    click_link "Add link"
    fill_in 'Full URL with http/https', :with => "https://github.com/ggriffis"
    fill_in 'Description', :with => "My github account"
    page.select 'Code Repository', :from => 'link_url_type'
    click_button "Create Link"
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', :with => "someotheruser@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"

    user = User.find_by_email("someotheruser@example.com")
    visit(user_path(user))
    page.should_not have_link("Delete") #need to refactor to look just for link delete
  end

  scenario "Cannot add a link to someone else's project" do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', :with => "someotheruser@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"

    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_content("Add link")
  end

  scenario "Cannot delete a link from someone else's project" do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    click_link "Add link"
    fill_in 'Full URL with http/https', :with => "https://github.com/ggriffis/some-project.git"
    fill_in 'Description', :with => "My project github account"
    page.select 'Code Repository', :from => 'link_url_type'
    click_button "Create Link"
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', :with => "someotheruser@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"

    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_link("Delete") #need to refactor to look just for link delete
  end

  scenario "Cannot edit a project on someone else's profile" do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', :with => "someotheruser@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"

    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_content("Edit")
    visit(user_path(project.user))
    page.should_not have_link("Edit") #need to refactor to look just for project edit
  end

  scenario "Cannot delete a project on someone else's profile" do
    click_link "Add project"
    fill_in 'Title', :with => "interesting project"
    fill_in 'Description',
      :with => "this project does some really interesting things"
    click_button "Create Project"
    click_link "Sign out"
    click_link "Sign in"
    fill_in 'Email', :with => "someotheruser@example.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"

    project = Project.find_by_title("interesting project")
    visit(project_path(project))
    page.should_not have_content("Delete")
    visit(user_path(project.user))
    page.should_not have_content('Delete')
  end

end
