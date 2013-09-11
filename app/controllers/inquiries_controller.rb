class InquiriesController < ApplicationController
  before_filter :find_user

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.deliver(@user)
      flash[:notice] = "Thank you! Your inquiry has been sent and I'll be in touch as soon as possible."
      redirect_to @user
    else
      render :new
    end
  end

private
  def find_user
    @user = User.find(params[:user_id])
  end

end
