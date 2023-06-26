require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:user) { User.create(name: "John Doe", email: "john@example.com", password: "password") }
  let(:venue) { Venue.create(name: "Venue 1", location: "Location 1", images: "venue_image.jpg") }
  let(:event) { Event.create(title: "Event 1", date: Date.today, time: Time.now, description: "Event description", venue: venue, images: "event_image.jpg", user: user) }

  subject(:ticket) do
    Ticket.new(
      ticket_type: "General Admission",
      quantity: 1,
      price: 10.0,
      event: event,
      user: user
    )
  end

  it "is valid with valid attributes" do
    expect(ticket).to be_valid
  end

  it "is not valid without a ticket_type" do
    ticket.ticket_type = nil
    expect(ticket).not_to be_valid
  end

  it "is not valid without a quantity" do
    ticket.quantity = nil
    expect(ticket).not_to be_valid
  end

  it "is not valid without a price" do
    ticket.price = nil
    expect(ticket).not_to be_valid
  end

  it "is not valid with a quantity less than or equal to 0" do
    ticket.quantity = 0
    expect(ticket).not_to be_valid
  end

  it "is not valid with a price less than 0" do
    ticket.price = -1
    expect(ticket).not_to be_valid
  end
end
