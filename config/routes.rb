Rails.application.routes.draw do
  

  # All Static Application Routes 
  root to: 'application#home'
  get "/covid_message", to: 'application#covid', as: 'scamazon-cares'
  get "/slime", to: 'application#slime', as: 'scamazon-slime'
  get "/conditionsofuse", to: "application#conditions", as: 'scamazon-conditionsofuse'
  get "/privacynotice", to: "application#privacynotice", as: 'scamazon-privacy'
  get "/privacy", to: "application#privacynotice"
  get '/seed', to: 'application#seed', as: 'seedythedeebee'
  post '/seed', to: 'application#populate'

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
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
    get 'show_profile', to: 'users/sessions#show'
    get 'profile', to: 'users/sessions#show'
    resources :gift_cards
    # resources :orders
    # resources :lists
    # resources :shooping_carts
    # resources :reviews
  end
  

end
