Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show] do
    resources :order_products, only: [:create]
    resources :orders, only: [:new, :create, :update]
    resources :reviews, only: [:show]
  end
  resources :orders, only: [:destroy, :show, :index] do
    resources :reviews, only: [:new, :create]
  end
  resources :chatrooms, only: :show do
  resources :messages, only: :create
  end
  get "start_chat", to: "chatrooms#start_chat", as: :start_chat
  resources :reviews, only: [:destroy]
  resources :users, only: [:index, :show]
end

#generate users controller with scope(producer bool), view, read claire scope on slack
