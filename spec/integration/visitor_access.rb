require 'spec_helper'
feature 'Valid access when signed in' do

  before do
    Factory(:user, :email => "codefellow@example.com")
  end

  scenario 'Can view a profile' do
  end

  scenario 'Can view a project' do
  end

  scenario "Can click a link on someone's profile" do
  end

  scenario "Cannot edit a profile" do
  end

  scenario "Cannot add a project to a profile" do
  end

  scenario "Cannot add a link to a profile" do
  end

  scenario "Cannot add a link to a project" do
  end

  scenario "Cannot edit a project on a profile" do
  end

end
