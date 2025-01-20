class Post < ApplicationRecord
  include Searchable

  validates :title, :description, :salary, :location, presence: true
  belongs_to :user
  has_many :job_applications
end
