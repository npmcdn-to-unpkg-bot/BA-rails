Rails.application.routes.draw do

  root 'pages#home'

  get '/home', to: 'pages#home'

  resources :users
  resources :posts
  resources :topics, only: [:new, :create, :show]

  get '/register', to: 'users#new'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'


end
