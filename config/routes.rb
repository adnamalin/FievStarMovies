Rails.application.routes.draw do
  root 'movies#index'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get 'movies/:id'=>'movies#show', as: 'movie'
end
