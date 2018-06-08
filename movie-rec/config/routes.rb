Rails.application.routes.draw do
  root "genres#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #roles resources
  resources :roles

  #movies resources
  resources :movies

  # genres resources
  resources :genres do
  	get :follow
  	get :unfollow
  end

  # people resources
  resources :people do 
    get :like
    get :unlike
  end
end
 