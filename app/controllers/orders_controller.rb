class OrdersController < ApplicationController
  def index
    render file: '/public/404' if !logged_in?
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

    CartHandler.make_order(user, session[:cart])

    flash[:success] = 'Order was successfully placed!'
    session.delete(:cart)
    redirect_to orders_path
  end

end
