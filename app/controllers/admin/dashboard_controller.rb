class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
  end

  def show
    @admin = User.find(params[:id])
  end

  def edit
    @admin = User.find(params[:id])
  end
end
