Rails.application.routes.draw do
  root to: "welcome#show"
  get "/login", to: 'sessions#new'

  get "/dashboard", to: 'users#show'

  resources :users, only: [:create, :new]

  resources :carts, only: [:create]
  get "/cart", to: 'carts#show'
  delete "/cart", to: 'carts#destroy'
  put "/cart", to: 'carts#update'

  resources :items, only: [:index, :show]


  get ":category_title", to: 'categories#show'


end
