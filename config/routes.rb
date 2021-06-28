Rails.application.routes.draw do
  resource :users, only: [:create]
  
  # post "/api/v1/auth", to: "auth#create"
  
  post "/login", to: "users#login"
  get "/login", to: "users#token_authenticate"

  delete "/tasks", to: "tasks#destroy_all"


  resources :tasks
end
