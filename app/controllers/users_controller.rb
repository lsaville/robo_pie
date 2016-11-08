class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    if @user.admin?
      redirect_to admin_dashboard_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Successfully Created Account!'
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :street, :city, :state, :zip, :phone, :password, :password_confirmation)
  end
end
