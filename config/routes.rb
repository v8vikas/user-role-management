Rails.application.routes.draw do
  devise_for :users
  get 'home/index', to: 'home#index'
  resources :admin, only: [:index]
  resources :doctor, only: [:index]
  resources :patient, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
