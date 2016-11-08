class Admin::UsersController < Admin::BaseController
  before_action :require_admin

  def edit
    @admin = User.find(params[:id])
    render file: '/public/404' unless @admin == current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:success] = 'Successfully updated!'
      redirect_to admin_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :street, :city, :state, :zip, :phone, :password, :password_confirmation)
  end

end
