Rails.application.routes.draw do
  resources :movies

  root 'movies#index'
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
