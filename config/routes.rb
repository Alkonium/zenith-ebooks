Rails.application.routes.draw do
  get 'static_pages/contact'

  get 'static_pages/about'

  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  root to: 'books#index'
  
  get "signup", :to => "users#new"
  get "login", :to => "sessions#login"
  post "login_attempt", :to => "sessions#login_attempt"
  get "logout", :to => "sessions#logout"
  get "home", :to => "sessions#home"
  get "profile", :to => "users#show"
  get "setting", :to => "sessions#setting"
  get "contact", :to => "static_pages#contact"
  get "about", :to => "static_pages#about"
  get "disclaimer", :to => "static_pages#disclaimer"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
