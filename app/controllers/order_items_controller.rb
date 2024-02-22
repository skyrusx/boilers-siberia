class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    product = Product.find(@order_item.product_id)

    respond_to do |format|
      if @order.save
        session[:order_id] = @order.id
        format.html { redirect_to "/products/#{product.id}", success: "Товар добавлен в корзину" }
        format.js {}
      else
        format.html { redirect_to "/products/#{product.id}", warning: "Товар не добавлен в корзину" }
        format.js {}
      end
    end
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_params)
    @order_items = current_order.order_items

    respond_to do |format|
      if @order.save
        format.html { redirect_to cart_path, success: "Товар добавлен в корзину" }
        format.js {}
      else
        format.html { render :action => 'edit' }
        format.js { render :action => 'edit' }
      end
    end
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  def order_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end
