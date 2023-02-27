Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :quotes
  resources :users
  # Defines the root path route ("/")
  # root "quotes#index"
  root "users#login"
end
