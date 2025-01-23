class Company < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :name, uniqueness: true
  validates :about, presence: true
end
