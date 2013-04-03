Guiaseo::Application.routes.draw do
  get "users/new"

  get "users/new"

  resources :contents

  resources :categories

  root :to => 'contents#index'

  match '/admin', to: 'admin#index'

end
