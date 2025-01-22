class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :job_applications
  has_many :profiles

  enum role: %i[admin employer job_seeker]
  after_initialize :set_default_role, if: :new_record?

  after_create :send_welcome_email

  # set default role to job_seeker  if not set
  def set_default_role
    self.role ||= :job_seeker
  end

  def send_welcome_email
    # debugger
    # UserMailer.welcome_email(self).deliver_later
    UserMailer.welcome_email(self).deliver_now
  end
end
