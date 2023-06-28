require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.new(
      name: 'John Doe',
      email: 'john@example.com',
      password: 'password'
    )
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'has many events' do
    association = User.reflect_on_association(:events)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many tickets' do
    association = User.reflect_on_association(:tickets)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many reservations' do
    association = User.reflect_on_association(:reservations)
    expect(association.macro).to eq(:has_many)
  end

  it 'is not an admin by default' do
    expect(user.admin?).to be_falsey
  end
end
