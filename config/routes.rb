Rails.application.routes.draw do

  root 'landing#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show]

  resources :organizations, only: [:index, :show]

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    patch '/dashboard', to: 'dashboard#update'
    resources :organizations, only: [:new, :create, :edit, :update, :show]
    get '/:organization/offering/new', to: 'offerings#new', as: 'new_offering'
    post '/:organization/offering/new', to: 'offerings#create'
    resources :offerings, only: [:new, :create, :edit, :update, :show]
    resources :tags, only: [:new, :create, :edit, :update, :show]
  end

end
