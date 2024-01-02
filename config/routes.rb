Rails.application.routes.draw do
  devise_for :users
  get 'cart', to: 'orders#cart', as: :cart
  root 'home#index'
  resources :products, controller: 'product', only: %i[index new create show]
  post 'add_to_basket', to: 'product#add_to_basket', as: :add_to_basket
  resources :manage, only: %i[index]
  resources :categories, controller: 'category', only: %i[index new create]
  resources :orders
  get 'checkout', to: 'orders#checkout', as: :checkout
  get 'complete_order', to: 'orders#complete_order', as: :complete_order
  resources :carts, only: %i[index]
  get 'account', to: 'users#show', as: :account
  resources :order_items
  resources :home, only: %i[index]
  resources :admin
end
