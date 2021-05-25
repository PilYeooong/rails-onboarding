Rails.application.routes.draw do
  resource :users, only: [:create]
  get '/users', to: 'users#index'
  post '/login', to: 'users#login'
end
