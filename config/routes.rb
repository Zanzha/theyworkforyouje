Rails.application.routes.draw do
  resources :notices
  resources :votes
  resources :propositions
  resources :terms
  resources :offices
  resources :parishes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
