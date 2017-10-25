Rails.application.routes.draw do

  devise_for :users
  root to: 'nihonshus#index'
  get '/search', to: 'nihonshus#search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :nihonshus, only: [:show, :new, :create]

end
