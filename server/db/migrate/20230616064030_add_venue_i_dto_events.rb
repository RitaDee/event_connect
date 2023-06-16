# frozen_string_literal: true

class AddVenueIDtoEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :venue, null: false, foreign_key: true
  end
end
