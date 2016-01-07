Rails.application.routes.draw do

	root 'home#index'

  post 'subscribe' => 'home#subscribe'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  devise_scope :user do
    get "signout", to: "users/sessions#destroy"
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  
end
