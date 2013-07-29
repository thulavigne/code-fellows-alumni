class UsersController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @object = @user
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile has been updated."
      redirect_to @user
    else
      flash[:alert] = "Profile has not been updated."
      render :action => "edit"
    end
  end


private
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def find_user
    @user = User.find(params[:id])
  end
end
