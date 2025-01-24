class JobApplication < ApplicationRecord
	belongs_to :user
	belongs_to :post
	# has_one_attached :resume # for active storage
	mount_uploader :resume, ResumeUploader

	enum status: %i[underReview accepted rejected]

	after_initialize :set_default_status, if: :new_record?
  
  private

	def set_default_status
	  self.status ||= :underReview
	end
end
