Rails.application.routes.draw do
  get 'movie/index' 
  resources :movies
  resources :screens
  resources :bookings
  resources :showtimes
  resources :theaters
  resources :tickets
  root 'movie#index'
end

