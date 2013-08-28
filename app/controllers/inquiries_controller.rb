class InquiriesController < ApplicationController
  before_filter :find_user

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.deliver(@user)
      render :thank_you
    else
      render :new
    end
  end

private
  def find_user
    @user = User.find(params[:user_id])
  end

end
