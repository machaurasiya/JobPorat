class CreateProfileJob < ApplicationJob
  queue_as :default

  def perform(user_id, profile_id)
    user = User.find(user_id)
    profile = Profile.find(profile_id)
    UserMailer.create_profile(user, profile).deliver_later

  end
end
