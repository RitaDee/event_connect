# frozen_string_literal: true

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
  resources :events
  resources :venues
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
