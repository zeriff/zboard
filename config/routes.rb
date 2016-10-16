Rails.application.routes.draw do
  resources :boards
  get 'follows/create'

  get 'follows/destroy'

  resources :categories
  resources :pins
  devise_for :users

  root to: 'home#index'

  post 'pin/getinfo', to: 'pins#getinfo', as: "pininfo"
  get 'pins/category/:category_id', to: 'pins#getbycategory', as: "categorize"


  get 'like/:id', to: "likes#create", as: :likes
  delete 'like/:id', to: "likes#destroy", as: :like

  get 'follow/:id', to: "follows#create", as: :follows
  delete 'follow/:id', to: "follows#destroy", as: :follow

  get 'findfriend', to: "home#findfriend", as: :findfriend
  get '/:username', to: "home#profile", as: :profile
  get ':username/board/:board_id', to: "home#board", as: :user_board
  get '/:username/pins', to: "home#pins", as: :user_pins

end
