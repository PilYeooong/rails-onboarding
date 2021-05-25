Rails.application.routes.draw do
  resource :users, only: [:create]

  get '/users', to: 'users#index'
  delete '/users', to: 'users#destroy'
  post '/login', to: 'users#login'

  get '/assets', to: 'assets#index'
  post '/assets', to: 'assets#create'
  get '/assets/:ticker', to: 'assets#show'

  get '/diaries', to: 'diaries#index'
  post '/diaries', to: 'diaries#create'
end
