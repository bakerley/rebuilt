class Worksite < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :address, presence: true
  validates :name, presence: true
  validates :user, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
