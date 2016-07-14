Rails.application.routes.draw do
  resources :movies, only: [:index, :show]

  root 'movies#index'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
