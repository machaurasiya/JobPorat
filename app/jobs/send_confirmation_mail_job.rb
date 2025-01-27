class SendConfirmationMailJob < ApplicationJob
  queue_as :default

  def perform(user_id, job_application_id)
    user = User.find(user_id)
    job_application = JobApplication.find(job_application_id)
    UserMailer.confirmation_mail(user, job_application).deliver_later
  end
end
