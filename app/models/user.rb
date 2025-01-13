class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :job_applications
  has_one :profile

  enum role: %i[admin employer job_seeker]
  after_initialize :set_default_role, if: :new_record?

  # set default role to job_seeker  if not set
  def set_default_role
    self.role ||= :job_seeker
  end
end
