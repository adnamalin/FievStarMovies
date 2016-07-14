
Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :destroy]
    resources :ratings, only: [:new, :create]
  end
  resources :users, only: [:new, :create]

  root 'movies#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
