class Post < ApplicationRecord
    belongs_to :user
    has_many :job_applications
end
