class AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin'

  def index
    @products_all = Product.all
    @products = @products_all.where(product_type: "Товар")
    @services = @products_all - @products

    @messages_all = Message.all
    @messages = @messages_all.where(type_feedback: :appeal)
    @orders = @messages_all - @messages

    @new_messages = @messages.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    @new_orders = @messages.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
