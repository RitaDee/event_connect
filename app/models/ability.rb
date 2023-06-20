# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    else
      can :read, Event
      can :read, Venue
      # Add other permissions as needed for non-admin users
    end
  end
end

