Rails.application.routes.draw do
  resources :radio_hosts
  resources :radio_shows
  root 'main#index'
  resources :posts
  resources :labels
  resources :categories

  get '/radio_shows/:id/schedules' => 'radio_shows#schedules'
  get '/radio_shows/:id/schedules/new' => 'radio_shows#new_schedule'
  post '/radio_shows/:id/schedules/create' => 'radio_shows#create_schedule'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
