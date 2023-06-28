# db/seeds.rb

# Create venues
venues = []
3.times do |i|
  venues << Venue.create!(
    name: "Venue #{i+1}",
    location: "Location #{i+1}",
    images: "venue#{i+1}.jpg"
  )
end

# Create users
users = []
3.times do |i|
  users << User.create!(
    name: "User #{i+1}",
    email: "user#{Time.now.to_i + i + 1}@example.com",
    password: "password",
    password_confirmation: "password"
  )
end

# Create events, tickets, and reservations
users.each do |user|
  3.times do |i|
    event = user.events.create!(
      title: "Event #{i+1} by #{user.name}",
      date: Date.today,
      time: Time.now,
      description: "Description #{i+1} for Event #{i+1}",
      venue: venues[i],
      images: "event#{i+1}.jpg"
    )

    10.times do |j|
      ticket = event.tickets.create!(
        user: user,
        quantity: rand(1..5),
        price: rand(10.0..50.0).round(2),
        ticket_type: "Ticket Type #{j+1} for Event #{i+1}"
      )

      # Create reservations
      Reservation.create!(
        ticket: ticket,
        user: user
      )
    end
  end
end
