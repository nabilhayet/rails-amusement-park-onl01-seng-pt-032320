Rails.application.routes.draw do
  resources :rides
  resources :attractions
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/signout' => 'users#signout'

  root 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
