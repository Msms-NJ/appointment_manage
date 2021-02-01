Rails.application.routes.draw do




  namespace :mini do
    mount_devise_token_auth_for 'MiniUser', at: 'users', controllers: {
      sessions: 'mini/sessions',
    }

    resources :users, only: [:update]

  end


  resources :mini_users

  resource :wechat, only: [:show, :create]

  get '/', to: 'home#index'

  get 'home/index'
  get 'home/dashboard'
  get 'home/about'
  get 'home/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
