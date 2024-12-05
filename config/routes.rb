# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'store/index'
  get 'cart', to: 'orders#cart', as: :cart
  get 'checkout', to: 'orders#checkout', as: :checkout
  get 'complete_order', to: 'orders#complete_order', as: :complete_order
  get 'account', to: 'users#show', as: :account

  post 'add_to_basket', to: 'product#add_to_basket', as: :add_to_basket
  post 'select_store/:id', to: 'store#select_store', as: :select_store

  resources :products, controller: 'product', only: %i[index new create]
  resources :categories, controller: 'category', only: %i[index new create]
  resources :orders
  resources :order_items
  resources :carts, only: %i[index]
  resources :manage, only: %i[index]
  resources :home, only: %i[index]
  resources :admin
  resources :store, only: %i[index show]

  scope ':store_name', as: 'store_name' do
    resources :menu, only: %i[index]
    resources :product, only: %i[show], param: :product_name
  end
end
