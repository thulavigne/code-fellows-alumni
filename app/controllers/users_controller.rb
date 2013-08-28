class UsersController < ApplicationController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @search = User.search(params[:q])
    @search.build_condition if @search.conditions.empty?
    if params[:search_name].present?
      @users = User.search_name(params[:search_name]).uniq
    elsif params[:search_skills].present?
      @users = User.search_skills(params[:search_skills]).uniq
    elsif params[:q].present?
      @users = @search.result(distinct: true)
    else
      @users = User.all
    end
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
