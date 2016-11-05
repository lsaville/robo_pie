class OrdersController < ApplicationController
  def index
    @orders = Order.where(user_id: session[:user_id])
  end

  def show
    @order = Order.find(params[:id])
  end

end
