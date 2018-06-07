Rails.application.routes.draw do
  root "roles#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #roles resources
  resources :roles

  # genres resources
  resources :genres do
  	get :follow
  	get :unfollow
  end
end
 