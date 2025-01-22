# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  get 'store/index'
  get 'cart', to: 'orders#cart', as: :cart
  get 'checkout', to: 'orders#checkout', as: :checkout
  get 'complete_order', to: 'orders#complete_order', as: :complete_order
  get 'account', to: 'users#show', as: :account

  resources :payments, only: %i[new create index]
  resources :payment_method

  post 'add_to_basket', to: 'product#add_to_basket', as: :add_to_basket
  post 'select_store/:id', to: 'store#select_store', as: :select_store

  resources :products, controller: 'product', only: %i[index new create]
  resources :categories, controller: 'category', only: %i[index new create]
  resources :orders do
    member do
      get 'check_in'
    end
  end
  resources :order_items
  resources :carts, only: %i[index]
  resources :manage, only: %i[index]
  resources :home, only: %i[index]
  resources :admin

  scope 'admin' do
    resources :mqtt_log, only: %i[index]
  end

  resources :store, only: %i[index show]

  scope ':store_name', as: 'store_name' do
    resources :menu, only: %i[index] do
      collection do
        resources :category, only: %i[index show], param: :category_name
      end
    end
    resources :product, only: %i[show], param: :product_name
  end

  scope 'admin' do 
    scope ':store_name', as: 'store_name' do
      scope 'availability' do
        resources :products, controller: 'admin/availability/products', only: %i[index update], param: :store_name
        patch 'products/update', to: 'admin/availability/products#update'
        resources :ingredients, controller: 'admin/availability/ingredients', only: %i[index update], param: :store_name
        patch 'ingredients/update', to: 'admin/availability/ingredients#update'
      end
    end
  end
end
