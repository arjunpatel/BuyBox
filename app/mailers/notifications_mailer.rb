class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@youdomain.dev"
  default :to => "you@youremail.dev"

  def new_message(message)
    @message = message
    mail(:subject => "[buybox.com] #{message.subject}")
  end

end