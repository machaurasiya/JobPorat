class Profile < ApplicationRecord
  validates :name, :mobile, :gender, :address, :pincode, presence: true
  validates :mobile, uniqueness: true
  belongs_to :user
  has_one_attached :image
end
