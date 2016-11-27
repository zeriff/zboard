Rails.application.routes.draw do
  root 'app#index'
  get '/api/getpins', to: "app#getpins"
  get 'app/index'
  get '*unmatched_route', to: 'app#index'


  resources :professions
  resources :boards
  resources :categories
  resources :pins

  # get 'api/pins', to: "pins#pins"
  devise_for :users, controllers: {registrations: 'registrations'}

  # root to: 'home#index'

  get ":username/follows", to: 'home#follows', as: :user_follows
  get ":username/followers", to: 'home#followers', as: :user_followers
  get ":username/savedpins", to: 'home#savedpins', as: :saved_pins
  get 'findfriend', to: "home#findfriend", as: :findfriend
  get '/:username', to: "home#profile", as: :profile
  get ':username/board/:board_id', to: "home#board", as: :user_board
  get '/:username/pins', to: "home#pins", as: :user_pins
  get ':username/followers', to: "home#followers", as: :follower_list
  get ':username/follows', to: "home#follows", as: :follow_list

  post 'pin/getinfo', to: 'pins#getinfo', as: "pininfo"
  get 'pins/category/:category_id', to: 'pins#getbycategory', as: "categorize"


  get 'like/:id', to: "likes#create", as: :likes
  delete 'like/:id', to: "likes#destroy", as: :like

  get 'save/:id', to: "save#create", as: :saves
  delete 'save/:id', to: "save#destroy", as: :save

  get 'follow/:id', to: "follows#create", as: :follows
  delete 'follow/:id', to: "follows#destroy", as: :follow
  delete 'follow/delete/:id', to: "follows#delete", as: :del_currupt_follow


  #search
  get "/search/:query", to: "search#search", as: :serach
  get "/searchlocations/:query", to: "search#locationSearch", as: :locationsearch
  #admin
  get 'superuser/dashboard'
  delete 'superuser/delete/user/:id', to: "superuser#delete_user", as: :destroy_user
  get 'superuser/createadmin/:id', to: "superuser#create_admin", as: :create_admin
  get 'superuser/manage_users', to: 'superuser#manage_users', as: :manage_users
  get 'superuser/manage_pins', to: 'superuser#manage_pins', as: :manage_pins
  get 'superuser/manage_categories', to: 'superuser#manage_categories', as: :manage_categories
  get 'superuser/manage_currupt', to: 'superuser#manage_currupt', as: :manage_currupt
end
