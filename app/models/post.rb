class Post < ApplicationRecord
    include Searchable
    belongs_to :user
    has_many :job_applications
end
