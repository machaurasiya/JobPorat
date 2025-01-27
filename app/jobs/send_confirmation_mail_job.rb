class SendConfirmationMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.confirmation_mail(user).deliver_later
  end
end
