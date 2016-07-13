Rails.application.routes.draw do
  get 'movies/:id'=>'movies#show', as: 'movie'
  resources :movies, only: [:show] do
    resources :reviews, only: [:index]
  end

  get '/' => 'pages#index'
  root 'movies#index'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'

end
