class SessionsController < ApplicationController
  def new
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to login_path
  end
end
