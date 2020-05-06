Rails.application.routes.draw do
  resources :gossips
  resources :comments

  resources :users, only: [:show]
  resources :cities, only: [:show]
  
  root 'gossips#index'
  get '/welcome/:id', to: 'welcome#show', as: 'welcome'
  get '/contact', to: 'welcome#contact'
  get '/team', to: 'welcome#team'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
