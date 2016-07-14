Rails.application.routes.draw do
<<<<<<< HEAD
  get 'movies/:id'=>'movies#show', as: 'movie'
  resources :movies, only: [:show] do
    resources :reviews, only: [:index]
  end

  get '/' => 'pages#index'
=======
  resources :movies

>>>>>>> 3c8ed6ba7fee9198ed674befc0f9b31a9c27bc95
  root 'movies#index'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
