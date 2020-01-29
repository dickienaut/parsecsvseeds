Rails.application.routes.draw do
  resources :user_climbs
  resources :users
  resources :images
  resources :login, only: [:create]

  get '/climbs', to: "climbs#index", as: 'climbs'
  resources :climbs




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
