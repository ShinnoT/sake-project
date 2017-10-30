Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root to: 'nihonshus#index'
  get '/search', to: 'nihonshus#search', as: 'search'
  # get '/search/(:sake1)/(:sake2)', to: 'comparisons#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :nihonshus, only: [:show, :new, :create] do
    post :get_barcode, on: :collection
    resources :reviews
    get 'comparisons/by_id', to: 'comparisons#show'
    resources :comparisons, only: :show
  end

  resources :users, only: [ :show ] do
    resources :reviews
  end
  # resources :users, only: [ :show ] do
  #   resources :reviews
  # end
end
