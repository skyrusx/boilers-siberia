class InfoMailer < ApplicationMailer

  def send_message()
    @message = params[:message]
    @subject = "#{Message::TYPES[@message.type_feedback.to_sym]} c сайта Котлы Сибири"
    mail(to: User.first.email, from: ENV["EMAIL_ADDRESS"], subject: @subject)
  end
end
