Rails.application.routes.draw do
  root to: "welcome#show"
  get "/login", to: 'users#login'

  resources :carts, only: [:create]
  get "/cart", to: 'carts#show'
  delete "/cart", to: 'carts#destroy'
  put "/cart", to: 'carts#update'

  resources :items, only: [:index, :show]


  get ":category_title", to: 'categories#show'


end
