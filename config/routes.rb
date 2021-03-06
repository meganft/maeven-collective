Rails.application.routes.draw do

  root 'landing#index'
  get 'landing/autocomplete_organization_name'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/search/results', to: 'search#index'

  get '/topics', to: 'tags#index'

  resources :users, only: [:new, :create, :show]
  resources :organizations, only: [:index, :show], param: :slug, path: "o"
  resources :categories, only: [:index, :show]

  namespace :organizations, only: [:show], path: "o" do
    resources :offerings, only: [:show], param: :slug, path: "of"
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    patch '/dashboard', to: 'dashboard#update'
    resources :organizations, only: [:new, :create, :edit, :update, :show]
    get '/:organization/offering/new', to: 'offerings#new', as: 'new_offering'
    post '/:organization/offering/new', to: 'offerings#create'
    resources :offerings, only: [:new, :create, :show, :destroy, :edit, :update]
    resources :tags
    resources :categories
  end

end
