# frozen_string_literal: true

class Venue < ApplicationRecord
  has_many :events

  validates :name, presence: true
  validates :location, presence: true
end
