Rails.application.routes.draw do
  root 'home#index'
  post 'subscribe' => 'home#subscribe'
end
