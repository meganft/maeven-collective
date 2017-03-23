Rails.application.routes.draw do

  root 'landing#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    patch '/dashboard', to: 'dashboard#update'
    resources :users, only: [:edit, :update]
    resources :items, only: [:index, :edit, :update, :show]
  end

end
