Rails.application.routes.draw do
  devise_for :users
  resources :movies
  root 'movies#index'
  resources :genres
  resources :stars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
