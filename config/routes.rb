Rails.application.routes.draw do
  resource :users, only: [:create]
  
 
  resource :sessions, only: %i[create destroy]
  get '/current_user', :to => 'sessions#show'
  

  delete "/tasks", to: "tasks#destroy_all"


  resources :tasks
end
