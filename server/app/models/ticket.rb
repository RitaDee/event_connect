class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :type, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
