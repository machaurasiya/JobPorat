class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Job Portal')
  end

  def confirmation_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Mail')
  end
end
