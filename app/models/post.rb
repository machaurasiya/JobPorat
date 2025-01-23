class Post < ApplicationRecord
  include Searchable

  belongs_to :user
  belongs_to :company
  has_many :job_applications
  validates :title, :description, :salary, :location, presence: true
end
