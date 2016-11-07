class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
  end

  def show
    @admin = User.find(params[:id])
    render file: '/public/404' unless @admin == current_user
  end

  def edit
    @admin = User.find(params[:id])
    render file: '/public/404' unless @admin == current_user
  end
end
