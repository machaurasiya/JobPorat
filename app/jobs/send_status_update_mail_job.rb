class SendStatusUpdateMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    UserMailer.status_update_mail(user).deliver_later
  end
end
