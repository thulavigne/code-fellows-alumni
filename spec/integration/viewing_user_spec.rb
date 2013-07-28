require 'spec_helper'
feature 'Viewing user profile' do

  let(:user) {Factory(:user, :email => "ginger@example.com")}

  before do
    Factory(:user, :email => "george@example.com")
  end

  scenario 'Viewing user profile via signing in' do
    visit(user_path(user))
    page.should have_content("ginger@example.com")
    page.should_not have_content("george@example.com")
  end

end
