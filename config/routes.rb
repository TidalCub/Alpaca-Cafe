Rails.application.routes.draw do
  resources :manage, only: [:index]
  resources :categories, controller: 'category', only: [:index, :new, :create]
end
