Rails.application.routes.draw do
  resources :movies, only: [:index, :show]
  resources :users, only: [:new, :create]

  root 'movies#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
