Rails.application.routes.draw do

  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'items#index'
  resources :users,only: [:new,:create]
  resources :items, only: [:new, :create, :show, :edit, :destroy, :update]
  resources :profiles,only: [:new,:create]
    resources :profiles do
      collection do
        get 'logout'
      end
    end
  resources :orders, only: [:new, :create]do
    collection do
      post 'purchase'
    end
  end
  resources :cards, only: [:new, :show,:destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end