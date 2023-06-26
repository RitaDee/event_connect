require 'rails_helper'

RSpec.describe Venue, type: :model do
  subject(:venue) do
    Venue.new(
      name: "Venue 1",
      location: "Location 1",
      images: "venue_image.jpg"
    )
  end

  it "is valid with valid attributes" do
    expect(venue).to be_valid
  end

  it "is not valid without a name" do
    venue.name = nil
    expect(venue).not_to be_valid
  end

  it "is not valid without a location" do
    venue.location = nil
    expect(venue).not_to be_valid
  end

  it "is not valid without images" do
    venue.images = nil
    expect(venue).not_to be_valid
  end

  it "has many events" do
    association = Venue.reflect_on_association(:events)
    expect(association.macro).to eq(:has_many)
  end
end