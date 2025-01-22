class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    # debugger
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Job Portal')
  end
end
