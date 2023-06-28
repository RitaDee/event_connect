Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 controllers: {
                   sessions: 'api/v1/users/sessions',
                   registrations: 'api/v1/users/registrations'
                 }

      resources :reservations
      resources :tickets
      resources :events do
        member do
          get 'tickets', to: 'tickets#event_tickets'
        end
      end
      resources :users do
        member do
          get 'reservations', to: 'users#reservations'
        end
      end
      resources :venues
    end
  end
end
