class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @object = @user
  end

end
