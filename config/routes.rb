Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users, :path_prefix => 'my'

  resources :users
  resources :roles
  resources :import_politicians
  resources :politicians
  resources :notices
  resources :votes
  resources :propositions
  resources :terms
  resources :offices
  resources :parishes

  get 'import/index'
  get 'import_props/index'
  get 'import/index'
  get 'home/index'
  get 'notices/index'
  get 'offices/index'
  get 'politicians/index'
  get 'propositions/index'
  get 'terms/index'
  get 'search', to: 'search#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end