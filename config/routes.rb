Guiaseo::Application.routes.draw do
  
  resources :contents
  resources :categories
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'contents#index'

  match '/admin', to: 'admin#index'
  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

end