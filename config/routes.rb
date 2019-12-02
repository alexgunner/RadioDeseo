Rails.application.routes.draw do
  resources :radio_hosts
  resources :radio_shows
  root 'main#index'
  resources :posts
  resources :labels
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
