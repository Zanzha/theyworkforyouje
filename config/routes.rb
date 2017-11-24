Rails.application.routes.draw do

  resource :admin_panel
  root to: "home#index"

  devise_for :users, :path_prefix => 'my'

  resources :users
  resources :import_politicians


  resources :votes
  resources :propositions
  resources :terms
  resources :offices
  resources :parishes

  resources :notices do
  collection do
    get :manage
  end
end

resources :politicians do
  collection do
    get :manage
  end
end

  get 'import/index'
  get 'import_props/index'
  get 'import_terms/index'
  get 'import_terms/show'
  get 'terms/index'
  get 'import/index'
  get 'home/index'
  get 'notices/index'
  get 'offices/index'
  get 'politicians/index'
  get 'propositions/index'
  get 'search', to: 'search#index'
  
end
