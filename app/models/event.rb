class Event < ApplicationRecord
  validates :title, :local, :date, :user, presence: true
  belongs_to :user
end
