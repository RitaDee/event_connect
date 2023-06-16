# frozen_string_literal: true

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  validates :ticket, presence: true
  validates :user, presence: true
end
