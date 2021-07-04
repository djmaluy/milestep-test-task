Rails.application.routes.draw do
  resource :users, only: [:create]
  
 
  resource :sessions, only: %i[create destroy]
  get '/current_user', :to => 'sessions#show'
  
  post 'confirm_email', :to => 'users#confirm_email'

  delete "/tasks", to: "tasks#destroy_all"


  resources :tasks
end
