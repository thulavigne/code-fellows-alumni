require 'spec_helper'
feature 'Alumni index' do

  before do
    Factory(:user, :email => "codefellow@example.com",
                              :first_name => "John",
                              :last_name => "Smith")
  end

  scenario 'Alumni index page' do
    visit (users_path)
    page.should have_content("John")
  end

end
