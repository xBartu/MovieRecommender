Rails.application.routes.draw do
  root "genres#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #roles resources
  resources :roles


  match 'movies/notification' => 'movies#notification', :via => :get
  #movies resources
  resources :movies do
    get :add_people
    post :add_person
  end

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
 