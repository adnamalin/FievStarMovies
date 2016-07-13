Rails.application.routes.draw do
  resources :movies

  get '/' => 'pages#index'
end
