Rails.application.routes.draw do
  resources :reservations
  resources :tickets
  resources :events
  resources :users
  resources :venues
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
