class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      flash[:success] = "Successfully updated item!"
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image, :status)
  end
end
