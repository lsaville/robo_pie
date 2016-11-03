class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::NumberHelper
  helper_method :number_to_currency

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your Cart"
    redirect_to items_path
  end

  def show
    @items = get_items(@cart.contents)
    @total = totalize(@cart.contents)
  end

  def destroy
    @item = Item.find(params[:item_id].to_i)
    @cart.contents.delete(params[:item_id])
    flash[:success] = %Q[Successfully removed #{view_context.link_to(@item.title, item_path(@item))} from your cart]
    redirect_to cart_path
  end

  def update
    @cart.contents[params[:item_id]] = params[:quantity].to_i
    redirect_to cart_path
  end
end
