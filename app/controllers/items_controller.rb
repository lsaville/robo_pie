class ItemsController < ApplicationController
  helper_method :active_item?

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def active_item?(item)
    item.status == "active"
  end
end
