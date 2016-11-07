class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: session[:user_id])
  end

  def show
    if current_user != Order.find(params[:id]).user && !current_user.admin?
      render file: '/public/404'
    else
      @order = Order.find(params[:id])
    end
  end

  def create
    user = User.find(session[:user_id])
    current_order = user.orders.new
    session[:cart].each do |item, quantity|
      current_order.items << Item.find(item)
      current_order.orders_items[-1].quantity = quantity
    end
    current_order.save
    flash[:success] = 'Order was successfully placed!'
    redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    order.update(status: params[:status])
    if order.save
      flash[:success] = 'Successfully updated status!'
    end
    redirect_to admin_dashboard_path
  end
end
