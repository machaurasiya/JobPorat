class SendStatusUpdateMailJob < ApplicationJob
  queue_as :default

  def perform(user_id, job_application_id)
    user = User.find(user_id)
    job_application = JobApplication.find(job_application_id)
    UserMailer.status_update_mail(user, job_application).deliver_later
  end
end
