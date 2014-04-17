class Listing < ActiveRecord::Base

  belongs_to :user
  has_many :images
  has_many :events
  has_event_calendar
  validates :user_id, presence: true
end
