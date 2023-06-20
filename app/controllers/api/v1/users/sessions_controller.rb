module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        respond_to :json
        include ActionController::Flash

        def create
          email = params[:user][:email]
          user = User.find_by(email: email)

          if user&.valid_password?(params[:user][:password])
            sign_in(user) # Sign in the user
            render json: {
              message: 'You are logged in.',
              user: {
                email: user.email,
                id: user.id,
                name: user.name
                # Include other user attributes you want to send
              }
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
    end
  end
end
