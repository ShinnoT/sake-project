Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root to: 'nihonshus#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :nihonshus, only: [:show, :new, :create]

  resources :users, only: [ :show ] do
    resources :reviews
  end
end
