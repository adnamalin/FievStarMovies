
Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :destroy]
    resources :ratings, only: [:new, :create]
  end
  resources :users, only: [:new, :create]
  resources :reviews, only: [:new, :create] do
    resources :ratings, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end

  root 'movies#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#invalid', as: "no_access"
end
