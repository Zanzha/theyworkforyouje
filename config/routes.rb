Rails.application.routes.draw do
  get 'import/index'

  resources :roles
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  get 'notices/index'
  get 'offices/index'
  get 'politicians/index'
  get 'propositions/index'
  get 'terms/index'
  resources :politicians
  resources :notices
  resources :votes
  resources :propositions
  resources :terms
  resources :offices
  resources :parishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
