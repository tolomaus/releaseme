class UserMailer < ActionMailer::Base
  default :from => $settings.email_address

  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
  end
end
