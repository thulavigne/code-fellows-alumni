require 'spec_helper'
feature 'Go to homepage' do

  scenario 'Go to homepage' do
    visit '/'
    page.current_url.should == users_path
  end

end
