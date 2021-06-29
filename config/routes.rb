Rails.application.routes.draw do
  resource :users, only: [:create]
  
 
  resource :sessions, only: %i[create destroy]
  get '/current_user', :to => 'sessions#show'
  # post "/login", to: "users#login"
  # get "/login", to: "users#token_authenticate"

  delete "/tasks", to: "tasks#destroy_all"


  resources :tasks
end
