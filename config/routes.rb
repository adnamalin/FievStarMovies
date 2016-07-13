Rails.application.routes.draw do
  get '/' => 'pages#index'

  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
end
