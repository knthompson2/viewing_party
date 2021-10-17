Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get '/discover', to: 'discover#show'

  resources :movies, only: [:index, :show]

  resources :users, only: [:new, :create] do
    get '/dashboard', to: 'users#show'
  end
  resources :friendships, only: [:create]
  resources :parties, only: [:new, :create]
end
