Rails.application.routes.draw do
  devise_for :users
  root 'category#index'
  resources :products, controller: 'product', only: [:index, :new, :create]
  post 'add_to_basket', to: 'product#add_to_basket', as: :add_to_basket
  resources :manage, only: [:index]
  resources :categories, controller: 'category', only: [:index, :new, :create]
  resources :orders
  get 'checkout', to: 'orders#checkout', as: :checkout
  get 'cart', to: 'orders#cart', as: :cart
  resources :carts, only: [:index]
end
