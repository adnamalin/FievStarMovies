Rails.application.routes.draw do
  root 'pages#index'

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
end
