Rails.application.routes.draw do
  root 'movies#index'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'

  get 'movies/:id'=>'movies#show', as: 'movie'
end
