class User < ApplicationRecord
  has_many :events
  has_many :tickets

  validates :name, presence: true
end
