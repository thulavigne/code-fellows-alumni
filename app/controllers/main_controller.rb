class MainController < ApplicationController
  def index
    @users = User.all
    if !@users.empty?
      @random_user = @users.at(Random.rand(@users.size))
      @projects = @random_user.projects
      if !@projects.empty?
        @random_project = @projects.at(Random.rand(@projects.size))
      end
    end
  end
end
