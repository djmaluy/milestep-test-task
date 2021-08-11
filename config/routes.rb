Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"

  resource :users, only: [:create, :update]

  get '/categories', :to => 'categories#index'

  get '/users', :to => 'users#index'

  resource :sessions, only: %i[create destroy]

  get '/current_user', :to => 'sessions#show'

  post 'confirm_email', :to => 'users#confirm_email'

  post '/presigned_url', to: 'direct_upload#create'

  delete "/tasks", to: "tasks#destroy_all"


  resources :tasks
end
