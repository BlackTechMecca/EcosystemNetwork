Rails.application.routes.draw do

  resources :connection_requests, :only [:index, :create, :destroy]
  resources :user_connections, :only [:index, :create, :destroy ]

  root 'home#index'

  post 'subscribe' => 'home#subscribe'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
    get "signout", to: "users/sessions#destroy"
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  
end
