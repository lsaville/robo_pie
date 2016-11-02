Rails.application.routes.draw do

  resources :carts, only: [:create]

  resources :items, only: [:index]

  get "/cart", to: 'carts#show'
  delete "/cart", to: 'carts#destroy'
  get ":category_title", to: 'categories#show'

end
