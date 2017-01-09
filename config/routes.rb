Rails.application.routes.draw do
    root to: 'home#index'

    # **************Devise***********************
    # ********************************************
    devise_for :users, controllers: { registrations: 'registrations' }

    resources :professions
    resources :boards
    resources :categories

    # **************Home_controller************
    # ******************************************
    get '/:username/follows', to: 'home#follows', as: :user_follows
    get '/:username/followers', to: 'home#followers', as: :user_followers
    get '/:username/savedpins', to: 'home#savedpins', as: :saved_pins, constraints: { username: /[^\/]+/ }
    get '/findfriend', to: 'home#findfriend', as: :findfriend
    get '/users/:username', to: 'home#profile', as: :profile, constraints: { username: /[^\/]+/ }
    get '/:username/board/:board_id', to: 'home#board', as: :user_board, constraints: { username: /[^\/]+/, board_id: /[^\/]+/ }
    get '/:username/pins', to: 'home#pins', as: :user_pins, constraints: { username: /[^\/]+/ }
    get '/:username/followers', to: 'home#followers', as: :follower_list, constraints: { username: /[^\/]+/ }
    get '/:username/follows', to: 'home#follows', as: :follow_list, constraints: { username: /[^\/]+/ }

    # *************Pins_controller************
    # ******************************************
    resources :pins, except: [:index]
    post 'pin/getinfo', to: 'pins#getinfo', as: 'pininfo'
    get 'pins/category/:category_id', to: 'pins#getbycategory', as: 'categorize'

    # *************Likes_controller************
    # ******************************************
    get 'like/status/:id', to: 'likes#get_like_status'
    get 'like/:id', to: 'likes#create', as: :likes
    delete 'like/:id', to: 'likes#destroy', as: :like

    # *************Save_controller************
    # ******************************************
    get 'save/status/:id', to: 'save#get_save_status'
    get 'save/:id', to: 'save#create', as: :saves
    delete 'save/:id', to: 'save#destroy', as: :save

    # *************Follows_controller************
    # ******************************************
    get 'follow/status/:id', to: 'follows#get_follow_status'
    get 'follow/:id', to: 'follows#create', as: :follows
    delete 'follow/:id', to: 'follows#destroy', as: :follow
    delete 'follow/delete/:id', to: 'follows#delete', as: :del_currupt_follow

    # *************Search_controller************
    # ******************************************
    get '/searchlocations/:query', to: 'search#locationSearch', as: :locationsearch
    get '/search', to: 'search#search', as: :search
    get '/find/:query', to: 'search#find'

    # *************Superuser_controller************
    # ******************************************
    get 'superuser/dashboard'
    delete 'superuser/delete/user/:id', to: 'superuser#delete_user', as: :destroy_user
    get 'superuser/createadmin/:id', to: 'superuser#create_admin', as: :create_admin
    get 'superuser/manage_users', to: 'superuser#manage_users', as: :manage_users
    get 'superuser/manage_pins', to: 'superuser#manage_pins', as: :manage_pins
    get 'superuser/manage_categories', to: 'superuser#manage_categories', as: :manage_categories
    get 'superuser/manage_currupt', to: 'superuser#manage_currupt', as: :manage_currupt

    # *****************API ROUTES*******************
    # **********************************************
    get 'api/get_saved', to: 'home#get_saved'
end
