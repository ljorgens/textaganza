Rails.application.routes.draw do
  devise_for :users
    root :to => 'home#index'

    resources :messages, only: [:index, :show, :new, :create]
    resources :contacts, only: [:index, :new, :create]
end
