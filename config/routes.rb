Rails.application.routes.draw do
  get "tms/users", to: "users#index"
  post "tms/signup", to: "users#signup"
  post "tms/login", to: "sessions#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
