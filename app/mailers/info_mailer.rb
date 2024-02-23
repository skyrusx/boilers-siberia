class InfoMailer < ApplicationMailer
  default from: "manager@boilers-siberia.ru"

  def send_message()
    @message = params[:message]
    @subject = "#{Message::TYPES[@message.type_feedback.to_sym]} c сайта Котлы Сибири"
    mail(to: 'phedotov-rus@yandex.ru', from: "manager@boilers-siberia.ru", subject: @subject)
  end
end
