class PassthroughController < ApplicationController
  def root
    if current_user.nil?
      redirect_to users_path
    else
      redirect_to user_path(current_user)
    end
  end
end
