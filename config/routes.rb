Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users, :path_prefix => 'my'

  resources :users
  resources :import_politicians
  resources :politicians
  resources :notices
  resources :votes
  resources :propositions
  resources :terms
  resources :offices
  resources :parishes
  get 'privacy', to: 'static_pages#privacy'
  get 'termsandconditions' , to: 'static_pages#tandc'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
