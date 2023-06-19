# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue

  has_many :tickets

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true
end
