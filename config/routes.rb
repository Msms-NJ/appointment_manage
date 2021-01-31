Rails.application.routes.draw do

  get '/', to: 'home#index'

  get 'home/index'
  get 'home/dashboard'
  get 'home/about'
  get 'home/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
