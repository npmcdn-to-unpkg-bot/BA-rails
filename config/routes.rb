Rails.application.routes.draw do

  root 'pages#home'

  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  # get '/contact', to: 'pages#contact'

  resources :users
  resources :posts
  resources :topics, only: [:new, :create, :show]

  get '/register', to: 'users#new'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  get '/logout', to: 'logins#destroy'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]




end
