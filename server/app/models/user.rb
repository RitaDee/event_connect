# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tickets
  has_many :events
  has_many :reservations
end
