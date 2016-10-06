Rails.application.routes.draw do
  resources :pins
  devise_for :users
  root to: 'home#index'
end
