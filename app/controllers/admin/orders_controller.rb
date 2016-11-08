class Admin::OrdersController < Admin::BaseController
  before_action :require_admin

  def update
    order = Order.find(params[:id])
    order.update(status: params[:status])
    if order.save
      flash[:success] = 'Successfully updated status!'
    end
    redirect_to admin_dashboard_path
  end
end
