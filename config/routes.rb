Rails.application.routes.draw do

  resources :carts, only: [:create]

  resources :items, only: [:index]

  get ":category_title", to: 'categories#show'

end
