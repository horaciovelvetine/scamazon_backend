Rails.application.routes.draw do
  

  # All Static Application Routes 
  root to: 'application#home'
  get "covid_message", to: 'application#covid', as: 'scamazon-cares'
  get "slime", to: 'application#slime', as: 'scamazon-slime'
  get "conditionsofuse", to: "application#conditions", as: 'scamazon-conditionsofuse'
  get "privacynotice", to: "application#privacynotice", as: 'scamazon-privacy'
  get "privacy", to: "application#privacynotice"
  get 'seed', to: 'application#seed', as: 'seedythedeebee'
  post 'seed', to: 'application#populate'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omni_auth',
    gift_cards: 'users/gift_cards',
    orders: 'users/orders',
    lists: 'users/lists',
    shopping_carts: 'users/shopping_carts',
    reviews: 'users/reviews'
  }
  devise_scope :user do

    ## Add in all of the default routes commonly used to do the same thing
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
    get 'show_profile', to: 'users/sessions#show'
    get 'profile', to: 'users/sessions#show'
    get 'users', to: 'users/sessions#show', as: 'user_profile'
    

    ## MIRROR DEVISE USERS ROUTING AND CONTROLLER PATHING
    scope module: 'users', path: 'user', as: 'user' do 
    
      ## RESOURCE: gift_card
      get 'gift_card_manager', to: 'gift_cards#show'
      post 'gift_card_manager', to: 'gift_cards#create'
    
      ## RESOURCE: list && order
      resources :lists, :orders
      
      ## RESOURCE: store :: for User has_one relationship
      resources :store, module: 'stores', as: 'store', only: [:create, :new, :edit, :show, :update, :destroy]
      
    end
    
    scope  path: 'user', as: 'user' do
      
      ## RSEOURCE: shopping_cart :: for user belonged carts
      resources :shooping_carts, only: [:show, :edit, :update, :destroy]
    
    end
    
    ## RESOURCE: shopping_cart :: for user NOT YET belonged carts
    resources :shooping_carts, only: [:show, :edit, :update, :destroy]
    
    ## NEST REVIEW UNDER ITEM / STILL NEED USER ACCESS
    scope module: 'items', path: 'item', as: 'item' do
    
      ## RESOURCE: review
      resources :reviews, shallow: true

    end
  end
  
  
  
  scope module: 'items' do 
    resources :items 
  end
  
  scope module: 'stores' do 

    ## RESOURCE store :: index not under User
    get '/stores', to: 'stores#index'

    ## RESOURCE inventory :: for store has_one relationship
    resources :inventory, only: [:show, :edit, :update, :destroy]
  end

end
