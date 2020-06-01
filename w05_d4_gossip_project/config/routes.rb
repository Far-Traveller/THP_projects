Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]

  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:first_name', to: 'welcome#user'

  root 'gossips#index'
end
