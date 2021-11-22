Rails.application.routes.draw do
  # resources :reviews
  # resources :items
  # resources :searches
  # resources :accounts
  # resources :gift_cards
  # resources :wallets
  # resources :statuses
  # resources :orders
  # resources :shopping_carts
  # resources :inventories
  # resources :lists
  # resources :stores
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  ## Include Template for adding in API namespaced routes
  namespace :api do
    namespace :v1 do
      ## define routes here for /api/v1/...
      get '/show_cart', to: 'carts#show'
      resources :carts
    end
  end


  ## All Devise Routing
    devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    # omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end




  # All static routes (these routes rails views??)
  root to: 'application#home'
  get "covid_message", to: 'application#covid', as: 'scamazon-cares'
  get "slime", to: 'application#slime', as: 'scamazonslime'
  get "termsandconditions", to: "application#conditions"
  get "privacynotice", to: "application#privacynotice", as: 'scamazon-privacy'
  get "privacy", to: "application#privacynotice"
  get 'seed', to: 'application#seed', as: 'seedythedeebee'
  post 'seed', to: 'application#populate'

end

#ADDS In ALL OG Routes to slowly build back to (suss out falsely nested store issue)

  
  
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   registrations: 'users/registrations',
  #   omniauth_callbacks: 'omni_auth',
  #   gift_cards: 'users/gift_cards',
  #   orders: 'users/orders',
  #   lists: 'users/lists',
  #   shopping_carts: 'users/shopping_carts',
  #   reviews: 'users/reviews',
  #   slimes: 'users/slimes',
  #   store: 'users/store'
  # }
  # devise_scope :user do
  #   ## Statick route to unlock slime for a user
  #   get 'slime_user', to: 'users/slimes#slime_user'
    
  #   ## Add in all of the default routes commonly used to do the same thing
  #   get 'sign_in', to: 'users/sessions#new'
  #   get 'sign_up', to: 'users/registrations#new'
  #   get 'sign_out', to: 'users/sessions#destroy'
  #   get 'login', to: 'users/sessions#new'
  #   get 'logout', to: 'users/sessions#destroy'
  #   get 'forgot_password', to: 'users/passwords#new'
  #   get 'reset_password', to: 'users/passwords#edit'
  #   get 'show_profile', to: 'users/sessions#show'
  #   get 'profile', to: 'users/sessions#show'
  #   get 'users', to: 'users/sessions#show', as: 'user_profile'
    

  #   ## MIRROR DEVISE USERS ROUTING AND CONTROLLER PATHING
  #   scope module: 'users', path: 'user', as: 'user' do 
    
  #     ## RESOURCE: gift_card
  #     get 'gift_card_manager', to: 'gift_cards#show'
  #     post 'gift_card_manager', to: 'gift_cards#create'
    
  #     ## RESOURCE: list && order
  #     resources :lists, :orders
  #     post 'lists/new', to: 'lists#create'
  #     post 'orders/new', to: 'orders#create'
      
  #     ## RESOURCE: store :: for User has_one relationship
  #     resources :store, only: [ :new, :create, :edit, :show, :update, :destroy]
      
  #   end
    
  #   scope  path: 'user', as: 'user' do
      
  #     ## RSEOURCE: shopping_cart :: for user belonged carts
  #     resources :shopping_carts, only: [:show, :edit, :update, :destroy]
    
  #   end
    
  #   ## RESOURCE: shopping_cart :: for user NOT YET belonged carts
  #   resources :shopping_carts, only: [:show, :edit, :update, :destroy]
    
  #   ## NEST REVIEW UNDER ITEM / STILL NEED USER ACCESS
  #   scope module: 'items', path: 'item/:id', as: 'item' do
    
  #     ## RESOURCE: review
  #     resources :reviews, shallow: true

  #   end
  # end
  
  # scope module: 'users' do
  #     ## ACTION ROUTES
  #   get 'add_item/:item_id/list/:id', to: 'lists#add_item', as: 'add_item_to_list'
  #   get 'remove_item/:item_id/list/:id', to: 'lists#remove_item', as: 'remove_item_from_list'
  # end

  # ## ADDITIONAL ACTION ROUTES FOR NON USER MODS
  # get 'add_item/:item_id/shopping_cart', to: 'shopping_carts#add_item', as: 'add_item_to_cart'
  # get 'remove_item/:item_id/shopping_cart', to: 'shopping_carts#remove_item', as: 'remove_item_from_cart'
  
  
  # scope module: 'items' do 
  #   resources :items 
  # end
  
  # scope module: 'stores', path: 'stores' do 

  #   ## RESOURCE inventory :: for store has_one relationship
  #   resources :inventory, only: [:show, :edit, :update, :destroy]

  #   get '/', to: 'stores#index', as:'all_stores'
  #   ## /sotre/:id/profile
    
  # end
  
  # scope module: 'stores', path: 'store' do
  #   get ':id/profile', to: 'stores#show', as: 'store_profile'
  # end

  # post 'search', to: 'searches#create'
  # get 'search/:id', to: 'searches#show', as: 'results'

  # ## the path that I want is: 
  # ## /search/sort_by/:selection

  # get '/search/sort_by/:selection', to: 'searches#sort_by', as: 'search/sort_by'