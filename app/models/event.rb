class Event < ApplicationRecord
  validates :title, :local, :date, :creator, presence: true
  belongs_to :creator, class_name: "User"
  has_many :participate_events, foreign_key: :event_id, dependent: :destroy
  has_many :participants, through: :participate_events, source: :user, dependent: :destroy

  scope :upcoming_events, -> { where(date: (Time.now)..) }
  scope :past_events, -> { where(date: ..(Time.now)) }
end
