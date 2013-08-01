class MainController < ApplicationController
  def index
    @users = User.all
    if !@users.empty?
      @random_user = @users.at(Random.rand(@users.size))
      @random_project = @random_user.random_project
    end
  end
end
