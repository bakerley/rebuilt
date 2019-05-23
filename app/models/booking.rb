class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :worksite
  validates :user, uniqueness: {scope: :worksite}
end
