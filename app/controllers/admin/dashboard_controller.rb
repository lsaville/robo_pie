class Admin::DashboardController < Admin::BaseController
  before_action :require_admin

  def index
    @orders = Order.all
    @orders_ordered = Order.where(status: 'ordered')
    @orders_paid = Order.where(status: 'paid')
    @orders_cancelled = Order.where(status: 'cancelled')
    @orders_completed = Order.where(status: 'completed')
  end

  def show
    @admin = User.find(params[:id])
    render file: '/public/404' unless @admin == current_user
  end

end
