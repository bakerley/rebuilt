class Worksite < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :address, presence: true
  validates :name, presence: true
  validates :user, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
