class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  has_many :tickets

  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :venue, presence: true
end
