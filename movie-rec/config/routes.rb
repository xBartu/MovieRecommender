Rails.application.routes.draw do
  resources :moviepeople
  root "genres#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #roles resources
  # resources :roles


  #create_genres
  match 'create_genres' => 'bot#create_genres', :via => :get

  #add movies
  match 'add_movies' => 'bot#add_movies', :via => :get

  match 'movies/notification' => 'movies#notification', :via => :get
  #recommendations
  match 'recommendations' => 'movies#recommendations', :via => :get
  #movies resources
  resources :movies do
    get :add_genres
    post :add_genre
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
 