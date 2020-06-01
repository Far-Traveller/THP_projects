Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips
  resources :users, only: [:show]
  resources :cities, only: [:show]
  resources :gossips do
    resources :comments
  end

  get '/team', to: 'team#index'
  get '/contact', to: 'contact#index'
  get '/welcome/:first_name', to: 'welcome#user'
end
