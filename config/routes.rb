Rails.application.routes.draw do
  get 'movies/:id'=>'movies#show', as: 'movie'
  resources :movies, only: [:show] do
    resources :reviews, only: [:index]
  end

  get '/' => 'pages#index'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
