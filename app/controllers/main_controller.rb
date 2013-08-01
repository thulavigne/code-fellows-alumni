class MainController < ApplicationController
  def index
    @users = User.all.to_a
    if !@users.empty?
      @random_user = @users.at(Random.rand(@users.size))
      @users.delete(@random_user)
      if !@users.empty?
        @random_user2 = @users.at(Random.rand(@users.size))
      end
    end
  end
end
