class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :job_applications
  has_many :profiles
  has_many :companies

  enum role: %i[admin employer job_seeker]

  after_initialize :set_default_role, if: :new_record?
  after_create :send_welcome_email

  private

  def set_default_role
    self.role ||= :job_seeker
  end

  def send_welcome_email
    # SendEmailsJob.set(wait: 1.minutes).perform_later(self)
    SendEmailsJob.perform_later(self)
  end
end
