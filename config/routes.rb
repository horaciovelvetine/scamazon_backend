Rails.application.routes.draw do
  
  root to: 'application#home'

  get '/seed', to: 'application#seed', as: 'seedythedeebee'
  post '/seed', to: 'application#populate'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end
  

end
