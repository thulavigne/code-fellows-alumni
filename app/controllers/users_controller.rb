class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @users = User.search params[:search]
  end

  def show
    @object = @user
  end

  def create
    @user = User.create( params[:user] )
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
  def find_user
    @user = User.find(params[:id])
  end
end
