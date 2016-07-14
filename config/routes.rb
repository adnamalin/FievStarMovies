
Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    get 'ratings/new', to: 'ratings#movie_new', as: 'ratings'
    post 'ratings', to: 'ratings#movie_create', as: 'new_rating'
    delete '/reviews/:id', to: 'reviews#destroy'
    resources :reviews, only: [:new, :create], shallow: true do
      resources :ratings, only: [:new, :create]
      resources :comments, only: [:new, :create]
    end
  end
  resources :users, only: [:new, :create]

  root 'movies#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/404' => 'sessions#invalid', as: "no_access"
end
