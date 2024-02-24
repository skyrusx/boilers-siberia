class MessagesController < AdminController
  def index
    @messages = Message.where(type_feedback: params[:type])
  end

  def show
    @message = Message.find(params[:id])
    @order = Order.find_by_id(@message.order_id)
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @order_items = current_order.order_items

    respond_to do |format|
      if @message.save
        InfoMailer.with(message: @message).send_message.deliver_later
        current_order.update_attribute :status, Order::STATUSES[:sent]
        session.delete(:order_id)

        format.html { redirect_to(application_page, success: success_message) }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to(application_page, warning: warning_message) }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:type_feedback, :name, :phone, :question, :order_id)
  end

  def application_page
    @message.type_feedback == "order" ? cart_path : root_path
  end

  def success_message
    @message.type_feedback == "order" ? "Ваш заказ успешно оформлен" : "Сообщение успешно отправлено"
  end

  def warning_message
    @message.type_feedback == "order" ? "Ошибка оформления заказа" : "Ошибка отправления сообщения"
  end
end
