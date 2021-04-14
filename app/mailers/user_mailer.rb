class UserMailer < ApplicationMailer
   default from: 'fakebook@spike.com'

  def welcome_email(user)
    @user = user 
    @url  = new_user_session_url
    mail(to: user.email, subject: 'Welcome to Fakebook')
  end
end
