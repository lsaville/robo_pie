class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    item = Item.find(params[:item_id])
    cart = session[:cart]
    flash[:notice] = "You now have #{pluralize(1, item.title)}"

    redirect_to items_path

  end
end
