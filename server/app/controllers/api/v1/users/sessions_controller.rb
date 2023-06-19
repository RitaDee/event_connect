# frozen_string_literal: true

module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        respond_to :json
        # include Devise::Controllers::Helpers
        include ActionController::Flash

  def create
    email = params[:user][:email]
    user = User.find_by(email:)

    if user&.valid_password?(params[:user][:password])
      render json: {
        message: 'You are logged in.',
        user:
      }, status: :ok
    else
      render json: {
        message: 'Invalid email or password.',
        error: 'User not found or incorrect password.'
      }, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:email, :password)
  end
end
