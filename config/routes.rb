Rails.application.routes.draw do
  get 'menu/show'
  resources :products, controller: 'product', only: [:index, :new, :create]
  resources :manage, only: [:index]
  resources :categories, controller: 'category', only: [:index, :new, :create]
end
