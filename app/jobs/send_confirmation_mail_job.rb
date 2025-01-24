class SendConfirmationMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.confirmation_mail(user).deliver
  end
end
