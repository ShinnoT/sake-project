Rails.application.routes.draw do

  get 'users/show'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'nihonshus#index'
  get '/search', to: 'nihonshus#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :nihonshus, only: [:show, :new, :create] do
    post :get_barcode, on: :collection
    resources :reviews
  end
  resources :users, only: [ :show ] do
    resources :reviews
  end
end
