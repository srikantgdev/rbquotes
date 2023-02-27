Rails.application.routes.draw do
  get 'login/index', to: 'login#index'
  post 'login/create', to: 'login#create'
  get '/logout', to: 'login#logout'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes
  resources :users
  # Defines the root path route ("/")
  # root "quotes#index"
  # root "login#index"
  root "login#index"
end
