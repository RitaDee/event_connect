require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(name: "John Doe") }
  let(:venue) { Venue.create(name: "Venue 1", location: "Location 1", images: "venue_image.jpg") }

  subject(:event) do
    Event.new(
      title: "Event 1",
      date: Date.today,
      time: Time.now,
      description: "Event description",
      venue: venue,
      images: "event_image.jpg",
      user: user
    )
  end

  it "is valid with valid attributes" do
    expect(event).to be_valid
  end

  it "is not valid without a title" do
    event.title = nil
    expect(event).not_to be_valid
  end

  it "is not valid without a date" do
    event.date = nil
    expect(event).not_to be_valid
  end

  it "is not valid without a time" do
    event.time = nil
    expect(event).not_to be_valid
  end

  it "is not valid without a description" do
    event.description = nil
    expect(event).not_to be_valid
  end

  it "is not valid without a venue" do
    event.venue = nil
    expect(event).not_to be_valid
  end

  it "is not valid without images" do
    event.images = nil
    expect(event).not_to be_valid
  end

  it "belongs to a user" do
    association = Event.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it "belongs to a venue" do
    association = Event.reflect_on_association(:venue)
    expect(association.macro).to eq(:belongs_to)
  end

  it "has many tickets" do
    association = Event.reflect_on_association(:tickets)
    expect(association.macro).to eq(:has_many)
  end
end