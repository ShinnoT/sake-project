Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root to: 'nihonshus#index'
  get '/search', to: 'nihonshus#search', as: 'search'
  get '/search_attr', to: 'nihonshus#search_attr', as: 'search_attr'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :nihonshus, only: [ :show ] do
    post :get_barcode, on: :collection
    resources :reviews, only: :create
  end
  # resources :users, only: [ :show ] do
  #   resources :reviews
  # end
end
