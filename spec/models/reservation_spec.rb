require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:venue) { Venue.create(name: 'Venue 1', location: 'Location 1', images: 'venue_image.jpg') }
  let(:event) { Event.create(title: 'Event 1', date: Date.today, time: Time.now, description: 'Event description', venue:, images: 'event_image.jpg', user:) }
  let(:ticket) { Ticket.create(ticket_type: 'General Admission', quantity: 1, price: 10.0, event:, user:) }

  subject(:reservation) do
    Reservation.new(
      ticket:,
      user:
    )
  end

  it 'is valid with valid attributes' do
    expect(reservation).to be_valid
  end

  it 'belongs to a ticket' do
    association = Reservation.reflect_on_association(:ticket)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a user' do
    association = Reservation.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
end
