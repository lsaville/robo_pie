class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_cart

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def get_items(contents)
    contents.reduce({}) do |result, (id, quantity)|
      result[Item.find(id.to_i)] = quantity
      result
    end
  end
end
