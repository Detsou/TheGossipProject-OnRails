Rails.application.routes.draw do
  resources :gossips do
    resources :likes, only: [:new, :create, :destroy]
  end
  resources :comments


  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities, only: [:show]
  
  root 'gossips#index'
  get '/welcome/:id', to: 'welcome#show', as: 'welcome'
  get '/contact', to: 'welcome#contact'
  get '/team', to: 'welcome#team'

  get '/users', to: 'users#new'
  get '/sessions', to: 'sessions#new'
end
