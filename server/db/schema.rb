ActiveRecord::Schema.define(version: 20_230_619_103_618) do
  enable_extension 'plpgsql'

  create_table 'events', force: :cascade do |t|
    t.string 'title'
    t.date 'date'
    t.time 'time'
    t.text 'description'
    t.bigint 'user_id', null: false
    t.bigint 'venue_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_events_on_user_id'
    t.index ['venue_id'], name: 'index_events_on_venue_id'
  end

  create_table 'reservations', force: :cascade do |t|
    t.bigint 'ticket_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_reservations_on_ticket_id'
    t.index ['user_id'], name: 'index_reservations_on_user_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.bigint 'event_id', null: false
    t.bigint 'user_id', null: false
    t.integer 'quantity'
    t.float 'price'
    t.string 'type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_tickets_on_event_id'
    t.index ['user_id'], name: 'index_tickets_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'venues', force: :cascade do |t|
    t.string 'name'
    t.string 'location'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'events', 'users'
  add_foreign_key 'events', 'venues'
  add_foreign_key 'reservations', 'tickets'
  add_foreign_key 'reservations', 'users'
  add_foreign_key 'tickets', 'events'
  add_foreign_key 'tickets', 'users'
end
