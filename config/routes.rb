Rails.application.routes.draw do

  resources :events
  resources :job_posts do
    collection do
      get 'search'
    end
  end

  root 'home#index'

  post 'subscribe' => 'home#subscribe'

  devise_for :users, controllers: { passwords: "users/passwords", sessions: "users/sessions", registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }
  
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  devise_scope :user do
    get "signout", to: "users/sessions#destroy"
  end
  
  resources :users, only: [:index, :show, :edit, :update]

  get 'activity', to: 'activities#index'
  resources :article
  
end
