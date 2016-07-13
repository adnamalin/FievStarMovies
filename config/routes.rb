Rails.application.routes.draw do
  resources :movies, only: [:show] do
    resources :reviews, only: [:index]
  end

  get '/' => 'pages#index'
end
