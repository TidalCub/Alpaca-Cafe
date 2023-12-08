Rails.application.routes.draw do
  devise_for :users
  root 'category#index'
  resources :products, controller: 'product', only: %i[index new create]
  post 'add_to_basket', to: 'product#add_to_basket', as: :add_to_basket
  resources :manage, only: %i[index]
  resources :categories, controller: 'category', only: %i[index new create]
  resources :orders
  get 'checkout', to: 'orders#checkout', as: :checkout
  get 'cart', to: 'orders#cart', as: :cart
  get 'complete_order', to: 'orders#complete_order', as: :complete_order
  resources :carts, only: %i[index]
end
