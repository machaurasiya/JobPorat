require 'csv'

class JobApplication < ApplicationRecord
	belongs_to :user
	belongs_to :post
	# has_one_attached :resume # for active storage
	mount_uploader :resume, ResumeUploader

	enum status: %i[underReview accepted rejected]

	after_initialize :set_default_status, if: :new_record?

  # export all job_application to CSV
  def self.to_csv
    attributes = %w{id status created_at updated_at post_title post_location company_name}
  
    CSV.generate(headers: true) do |csv|
      csv << attributes
      
      all.includes(post: :company).each do |job|
        csv << job.attributes.values_at(*attributes[0..3]) +
               [job.post.title, job.post.location, job.post.company.name]
      end
    end
  end
  
  
  private

	def set_default_status
	  self.status ||= :underReview
	end
end
