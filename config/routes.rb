Rails.application.routes.draw do
  resources :pins
  devise_for :users
  root to: 'home#index'
  post 'pin/getinfo', to: 'pins#getinfo', as: "pininfo"

end
