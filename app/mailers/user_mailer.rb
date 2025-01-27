class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Job Portal')
  end

  # def confirmation_mail(user, job_application)
  #   @user = user
  #   @job_application = job_application
  #   @post = @job_application.post
  #   @company = @post.company

  #   mail(to: @user.email, subject: 'Confirmation Mail')
  # end

  def confirmation_mail(user, job_application)
    @user = user
    @job_application = job_application
    @post = @job_application.post
    @company = @post.company
    @profile = @user.profiles.first

    mail(to: @user.email, subject: 'Confirmation Mail')
  end

  # def status_update_mail(user, job_application)
  #   @user = user
  #   @job_application = job_application

  #   mail(to: @user.email, subject: 'Status Update')
  # end

  def status_update_mail(user, job_application)
    @user = user
    @job_application = job_application
    @post = @job_application.post
    @company = @post.company
    @profile = @user.profiles.first

    mail(to: @user.email, subject: 'Status Update')
  end

  def create_profile(user, profile)
    @user = user
    @profile = profile

    mail(to: @user.email, subject: 'Profile Created')
  end
end
