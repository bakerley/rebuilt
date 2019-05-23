class Worksite < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :address, presence: true
  validates :name, presence: true
  validates :user, presence: true
end
