class UserMailer < ActionMailer::Base
  default :from => SETTINGS[:email_address]

  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
    headers['X-MC-GoogleAnalytics'] = SETTINGS[:domain]
    headers['X-MC-Tags'] = "welcome"
  end
end
