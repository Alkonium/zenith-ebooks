Rails.application.routes.draw do
  resources :carts
  get 'users/new'

  resources :seriesfranchises
  resources :franchises
  resources :bookseries
  resources :series
  resources :bookgenres
  resources :purchases
  resources :authors
  resources :books
  resources :users
  resources :genres
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
