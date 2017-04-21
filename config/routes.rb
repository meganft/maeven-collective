Rails.application.routes.draw do

  root 'landing#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search/results', to: 'search#index'

  get '/discover/topics', to: 'discover#index'

  resources :users, only: [:new, :create, :show]
  resources :organizations, only: [:index, :show]
  resources :categories, only: [:index, :show]

  namespace :organizations, only: [:show] do
    resources :offerings, only: [:show]
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    patch '/dashboard', to: 'dashboard#update'
    resources :organizations, only: [:new, :create, :edit, :update, :show]
    get '/:organization/offering/new', to: 'offerings#new', as: 'new_offering'
    post '/:organization/offering/new', to: 'offerings#create'
    resources :offerings, only: [:new, :create, :show, :destroy, :edit, :update]
    resources :tags, only: [:new, :create]
    resources :categories, only: [:new, :create]
  end

end
