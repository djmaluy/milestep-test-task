Rails.application.routes.draw do
  resource :users, only: [:create]
  
  post "/login", to: "users#login"
  get "auto_login", to: "users#auto_login"

  delete "/tasks", to: "tasks#destroy_all"

  resources :tasks
end
