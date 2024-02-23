class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
    @order_id = session[:order_id]
    @message = Message.new
  end
end
