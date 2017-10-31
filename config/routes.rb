Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root to: 'nihonshus#index'
  get '/search', to: 'nihonshus#search', as: 'search'
  get '/search_attr', to: 'nihonshus#search_attr', as: 'search_attr'
  # get '/search/(:sake1)/(:sake2)', to: 'comparisons#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :nihonshus, only: [:show] do
    post :get_barcode, on: :collection
    # get 'comparisons/by_id', to: 'comparisons#show'
    # get '/search', to: 'nihonshus#search', as: 'search'
    resources :nihonshus, only: [:show], param: :second_id do
      # resources :comparisons, only: :display
      get 'comparisons', to: 'comparisons#display'
    end
    # resources :comparisons, only: :show
    resources :reviews, only: :create
    resources :savings, only: [ :new, :create ]
  end

  resources :users, only: :show
end
