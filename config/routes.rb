Rails.application.routes.draw do

	root 'home#index'

  post 'subscribe' => 'home#subscribe'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  devise_scope :user do
    get "signout", to: "users/sessions#destroy"
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  
end
