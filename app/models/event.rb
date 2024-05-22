class Event < ApplicationRecord
  validates :title, :local, :date, :creator, presence: true
  belongs_to :creator, class_name: "User"
end
